// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

library amplify_push_notifications;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_push_notifications/src/native_push_notifications_plugin.g.dart';
import 'package:amplify_secure_storage/amplify_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _tokenReceivedEventChannel = EventChannel(
  'com.amazonaws.amplify/push_notification/event/TOKEN_RECEIVED',
);
const _notificationOpenedEventChannel = EventChannel(
  'com.amazonaws.amplify/push_notification/event/NOTIFICATION_OPENED',
);
const _foregroundNotificationEventChannel = EventChannel(
  'com.amazonaws.amplify/push_notification/event/FOREGROUND_MESSAGE_RECEIVED',
);

const _externalHandleKey = 'externalHandleKey';

const _notificationsConfigSecureStorageKey =
    'notificationsConfigSecureStorageKey';

/// {@template amplify_push_notifications.amplify_push_notifications}
/// Implementation of the Amplify Push Notifications category.
///
/// - Concrete implementation of the Plugin Interface
/// - Communicates with native module via [PushNotificationsHostApi]
/// {@endtemplate}
class AmplifyPushNotifications extends PushNotificationsPluginInterface {
  /// {@macro amplify_push_notifications.amplify_push_notifications}
  AmplifyPushNotifications({
    required ServiceProviderClient serviceProviderClient,
    required Future<void> Function() backgroundProcessor,
    AmplifySecureStorage? amplifySecureStorage,
    PushNotificationsHostApi? hostedApi,
  })  : _serviceProviderClient = serviceProviderClient,
        _backgroundProcessor = backgroundProcessor,
        _flutterApi = _PushNotificationsFlutterApi(),
        _hostApi = hostedApi ?? PushNotificationsHostApi(),
        _amplifySecureStorage = amplifySecureStorage ??
            AmplifySecureStorage(
              config: AmplifySecureStorageConfig(
                scope: 'amplifyPushNotifications',
              ),
            ) {
    _onTokenReceived = _tokenReceivedEventChannel
        .receiveBroadcastStream()
        .cast<Map<Object?, Object?>>()
        .map((payload) {
      return payload['token'] as String;
    }).distinct();
    _onForegroundNotificationReceived = _foregroundNotificationEventChannel
        .receiveBroadcastStream()
        .cast<Map<Object?, Object?>>()
        .map(PushNotificationMessage.fromJson);

    _onNotificationOpened = _notificationOpenedEventChannel
        .receiveBroadcastStream()
        .cast<Map<Object?, Object?>>()
        .map(PushNotificationMessage.fromJson);
  }

  final AmplifyLogger _logger =
      AmplifyLogger.category(Category.pushNotifications)
          .createChild('AmplifyPushNotification');
  final ServiceProviderClient _serviceProviderClient;
  final PushNotificationsHostApi _hostApi;
  final _PushNotificationsFlutterApi _flutterApi;
  final AmplifySecureStorage _amplifySecureStorage;
  late final Stream<String> _onTokenReceived;
  late final Stream<PushNotificationMessage> _onForegroundNotificationReceived;
  late final Stream<PushNotificationMessage> _onNotificationOpened;
  var _isConfigured = false;
  PushNotificationMessage? _launchNotification;
  final Future<void> Function() _backgroundProcessor;

  @override
  PushNotificationMessage? get launchNotification {
    final result = _launchNotification;
    _launchNotification = null;
    return result;
  }

  @override
  Stream<String> get onTokenReceived => _onTokenReceived;

  @override
  Stream<PushNotificationMessage> get onNotificationReceivedInForeground =>
      _onForegroundNotificationReceived;

  @override
  Stream<PushNotificationMessage> get onNotificationOpened =>
      _onNotificationOpened;

  @override
  Future<void> onNotificationReceivedInBackground(
    OnRemoteMessageCallback callback,
  ) async {
    if (Platform.isAndroid) {
      final callbackHandle = PluginUtilities.getCallbackHandle(callback);
      if (callbackHandle == null) {
        _logger.error(
          'Callback is not a global or static function',
        );
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      await prefs.setInt(_externalHandleKey, callbackHandle.toRawHandle());
    } else if (Platform.isIOS) {
      await _flutterApi.registerOnReceivedInBackgroundCallback(callback);
    }
  }

  @override
  Future<void> identifyUser({
    required String userId,
    required AnalyticsUserProfile userProfile,
  }) async {
    await _serviceProviderClient.identifyUser(
      userId: userId,
      userProfile: userProfile,
    );
  }

  @override
  Future<void> configure({
    AmplifyConfig? config,
    required AmplifyAuthProviderRepository authProviderRepo,
  }) async {
    final notificationsConfig = config?.notifications?.awsPlugin;
    if (notificationsConfig == null) {
      throw const PushNotificationException(
        'No Pinpoint plugin config available',
      );
    }

    if (_isConfigured) {
      return;
    }

    // Initialize Endpoint Client
    await _serviceProviderClient.init(
      config: notificationsConfig,
      authProviderRepo: authProviderRepo,
    );

    await registerDeviceWhenConfigure();
    attachEventChannelListeners();

    await initializeBackgroundMethods();

    // Explicitly set the service provider so Analytics can be recorded when notification arrives in Background/Killed state
    _flutterApi.setProvider(_serviceProviderClient);

    await chekcAndRecordlaunchNotification();

    // Config is securely stored to be used to re-configure Amplify in the background processor function when the app is killed
    await _amplifySecureStorage.write(
      key: _notificationsConfigSecureStorageKey,
      value: jsonEncode(config),
    );
    _isConfigured = true;
  }

  @override
  Future<bool> requestPermissions({
    bool alert = true,
    bool badge = true,
    bool sound = true,
  }) {
    return _hostApi.requestPermissions(
      PermissionsOptions(
        alert: alert,
        sound: badge,
        badge: sound,
      ),
    );
  }

  @override
  Future<PushNotificationPermissionStatus> getPermissionStatus() async {
    final result = await _hostApi.getPermissionStatus();
    switch (result.status) {
      case PermissionStatus.denied:
        return PushNotificationPermissionStatus.denied;
      case PermissionStatus.granted:
        return PushNotificationPermissionStatus.granted;
      case PermissionStatus.shouldExplainThenRequest:
        return PushNotificationPermissionStatus.shouldExplainThenRequest;
      case PermissionStatus.shouldRequest:
        return PushNotificationPermissionStatus.shouldRequest;
    }
  }

  @override
  Future<int> getBadgeCount() {
    return _hostApi.getBadgeCount();
  }

  @override
  Future<void> setBadgeCount(int badgeCount) async {
    await _hostApi.setBadgeCount(badgeCount);
  }

  @visibleForTesting
  Future<void> initializeBackgroundMethods() async {
    if (Platform.isAndroid) {
      // Register the background processor callback
      await registerCallback(
        _backgroundProcessor,
      );
    } else if (Platform.isIOS) {
      await onNotificationReceivedInBackground(
        (remotePushMessage) => _serviceProviderClient.recordNotificationEvent(
          eventType: PinpointEventType.backgroundMessageReceived,
          notification: remotePushMessage,
        ),
      );
    }
  }

  @visibleForTesting
  Future<void> registerCallback(
    Future<void> Function() callback,
  ) async {
    final callbackHandle = PluginUtilities.getCallbackHandle(callback);
    if (callbackHandle == null) {
      _logger.error(
        'Callback is not a global or static function',
      );
      return;
    }
    await _hostApi.registerCallbackFunction(
      callbackHandle.toRawHandle(),
    );
    _logger.info('Successfully registered callback');
  }

  @visibleForTesting
  Future<void> chekcAndRecordlaunchNotification() async {
    final rawLaunchNotification = await _hostApi.getLaunchNotification();
    if (rawLaunchNotification != null) {
      final launchNotification =
          PushNotificationMessage.fromJson(rawLaunchNotification);
      _launchNotification = launchNotification;
      _recordAnalyticsForLaunchNotification(launchNotification);
    }
  }

  @visibleForTesting
  Future<void> registerDeviceWhenConfigure() async {
    late String deviceToken;
    try {
      deviceToken = await onTokenReceived.first;
    } on Exception catch (error) {
      // the error mostly like is the App doesn't have corresponding
      // capability to request a push notification device token
      throw PushNotificationException(
        'Error occurred awaiting for device token to register device with Pinpoint',
        recoverySuggestion: 'Please review the underlying exception',
        underlyingException: error,
      );
    }
    await _registerDevice(deviceToken);
  }

  void _foregroundNotificationListener(
    PushNotificationMessage pushNotificationMessage,
  ) =>
      _serviceProviderClient.recordNotificationEvent(
        eventType: PinpointEventType.foregroundMessageReceived,
        notification: pushNotificationMessage,
      );

  void _notificationOpenedListener(
    PushNotificationMessage pushNotificationMessage,
  ) =>
      _serviceProviderClient.recordNotificationEvent(
        eventType: PinpointEventType.notificationOpened,
        notification: pushNotificationMessage,
      );

  void _tokenReceivedListener(String deviceToken) {
    unawaited(_registerDevice(deviceToken));
  }

  Future<void> _registerDevice(String address) async {
    try {
      await _serviceProviderClient.registerDevice(address);
      _logger.info('Successfully registered device with the service provider');
    } on Exception catch (error) {
      // the error mostly like is the App doesn't have corresponding
      // capability to request a push notification device token
      throw PushNotificationException(
        'Error occurred awaiting for device token to register device with Pinpoint',
        recoverySuggestion: 'Please review the underlying exception',
        underlyingException: error,
      );
    }
  }

  @visibleForTesting
  void attachEventChannelListeners() {
    // Initialize listeners
    onTokenReceived.listen(_tokenReceivedListener).onError((Object error) {
      _logger.error(
        'Unexpected error $error received from onTokenReceived event channel.',
      );
    });
    onNotificationReceivedInForeground
        .listen(_foregroundNotificationListener)
        .onError((Object error) {
      _logger.error(
        'Unexpected error $error received from onNotificationReceivedInForeground event channel.',
      );
    });

    onNotificationOpened
        .listen(_notificationOpenedListener)
        .onError((Object error) {
      _logger.error(
        'Unexpected error $error received from onNotificationOpened event channel.',
      );
    });
  }

  void _recordAnalyticsForLaunchNotification(
    PushNotificationMessage launchNotification,
  ) =>
      _serviceProviderClient.recordNotificationEvent(
        eventType: PinpointEventType.notificationOpened,
        notification: launchNotification,
      );
}

class _PushNotificationsFlutterApi implements PushNotificationsFlutterApi {
  _PushNotificationsFlutterApi() {
    PushNotificationsFlutterApi.setup(this);
  }
  final _recordEventQueue = <Map<Object?, Object?>>[];

  ServiceProviderClient? _serviceProviderClient;

  final _onNotificationReceivedInBackgroundCallbacks =
      <OnRemoteMessageCallback>[];

  Future<void> registerOnReceivedInBackgroundCallback(
    OnRemoteMessageCallback callback,
  ) async {
    _onNotificationReceivedInBackgroundCallbacks.add(callback);
    // unawaited(_flushRecordEvents());
  }

  void setProvider(ServiceProviderClient serviceProviderClient) {
    // Flush only when the SericeProvider becomes available in config
    _serviceProviderClient = serviceProviderClient;
    unawaited(_flushRecordEvents());
  }

  void recordPushEvent(PushNotificationMessage pushNotificationMessage) {
    _serviceProviderClient?.recordNotificationEvent(
      eventType: PinpointEventType.backgroundMessageReceived,
      notification: pushNotificationMessage,
    );
  }

  Future<void> dispatchToExternalHandle(
    PushNotificationMessage pushNotificationMessage,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    final externalHandle = prefs.getInt(_externalHandleKey);
    if (externalHandle == null) {
      return;
    }
    final externalCallback = PluginUtilities.getCallbackFromHandle(
      CallbackHandle.fromRawHandle(externalHandle),
    );
    if (externalCallback == null) {
      safePrint(
        'Could not locate external callback for the stored external handle',
      );
      return;
    }
    if (externalCallback is! OnRemoteMessageCallback) {
      throw PushNotificationException(
        'Invalid callback type: ${externalCallback.runtimeType}',
      );
    }
    externalCallback(pushNotificationMessage);
  }

  @override
  Future<void> onNotificationReceivedInBackground(
    Map<Object?, Object?> payload,
  ) async {
    final notification = PushNotificationMessage.fromJson(payload);
    await dispatchToExternalHandle(notification);
    await Future.wait(
      _onNotificationReceivedInBackgroundCallbacks.map(
        (callback) async {
          await callback(notification);
        },
      ),
    );
    // Flush only if ServiceProvider is available
    if (_serviceProviderClient != null) {
      await _flushRecordEvents(withItem: payload);
    } else {
      _recordEventQueue.add(payload);
    }
  }

  Future<void> _flushRecordEvents({Map<Object?, Object?>? withItem}) async {
    for (final element in [..._recordEventQueue, withItem]
        .whereType<Map<Object?, Object?>>()) {
      final notification = PushNotificationMessage.fromJson(element);
      recordPushEvent(notification);
    }
    _recordEventQueue.clear();
  }
}
