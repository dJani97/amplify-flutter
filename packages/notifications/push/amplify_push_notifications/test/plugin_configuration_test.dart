import 'dart:convert';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_push_notifications/amplify_push_notifications.dart';
import 'package:amplify_push_notifications/src/native_push_notifications_plugin.g.dart';
import 'package:amplify_secure_storage/amplify_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'plugin_configuration_test.mocks.dart';
import 'test_data/fake_amplify_configuration.dart';
import 'test_data/fake_defective_configuration.dart';
import 'test_data/fake_notification_messges.dart';
import 'util.dart';

Future<void> testGlobalCallbackFunction() async {}

@GenerateMocks(
  [
    PushNotificationsHostApi,
    ServiceProviderClient,
    AmplifySecureStorage,
  ],
)
void main() {
  const tokenReceivedEventChannel = EventChannel(
    'com.amazonaws.amplify/push_notification/event/TOKEN_RECEIVED',
  );

  final log = <MethodCall>[];
  late TestWidgetsFlutterBinding testWidgetsFlutterBinding;
  final authProviderRepo = AmplifyAuthProviderRepository()
    ..registerAuthProvider(
      const AmplifyAuthProviderToken(''),
      TestIamAuthProvider(),
    );
  late AmplifyPushNotifications plugin;
  late MockServiceProviderClient mockServiceProviderClient;
  late MockPushNotificationsHostApi mockPushNotificationsHostApi;

  Future<Map<String, dynamic>?>? handler(MethodCall methodCall) async {
    log.add(methodCall);
    if (methodCall.method == 'listen') {
      await testWidgetsFlutterBinding.defaultBinaryMessenger
          .handlePlatformMessage(
        tokenReceivedEventChannel.name,
        tokenReceivedEventChannel.codec
            .encodeSuccessEnvelope(<String, dynamic>{'token': '123'}),
        (_) {},
      );
    }
    return null;
  }

  Future<Map<String, dynamic>?>? throwErrorHandler(
    MethodCall methodCall,
  ) async {
    log.add(methodCall);
    if (methodCall.method == 'listen') {
      await testWidgetsFlutterBinding.defaultBinaryMessenger
          .handlePlatformMessage(
        tokenReceivedEventChannel.name,
        tokenReceivedEventChannel.codec.encodeErrorEnvelope(
          code: 'test',
          message: 'error',
        ),
        (_) {},
      );
    }
    return null;
  }

  final config = AmplifyConfig.fromJson(
    jsonDecode(amplifyconfig) as Map<String, Object?>,
  );

  setUp(() {
    testWidgetsFlutterBinding = TestWidgetsFlutterBinding.ensureInitialized();

    mockPushNotificationsHostApi = MockPushNotificationsHostApi();
    mockServiceProviderClient = MockServiceProviderClient();
    plugin = AmplifyPushNotifications(
      serviceProviderClient: mockServiceProviderClient,
      backgroundProcessor: () async => {},
      amplifySecureStorage: MockAmplifySecureStorage(),
      hostedApi: mockPushNotificationsHostApi,
    );

    testWidgetsFlutterBinding.defaultBinaryMessenger.setMockMethodCallHandler(
      MethodChannel(tokenReceivedEventChannel.name),
      handler,
    );
  });

  tearDown(log.clear);

  group('Push Notifications config', () {
    test('should configure correctly', () async {
      log.clear();
      when(mockPushNotificationsHostApi.getLaunchNotification()).thenAnswer(
        (_) => Future(() => androidPushMessage),
      );
      await plugin.configure(
        authProviderRepo: authProviderRepo,
        config: config,
      );
      expect(log, <Matcher>[
        isMethodCall('listen', arguments: null),
        isMethodCall('cancel', arguments: null),
        isMethodCall('listen', arguments: null),
      ]);
      verify(
        mockServiceProviderClient.recordNotificationEvent(
          eventType: anyNamed('eventType'),
          notification: anyNamed('notification'),
        ),
      ).called(1);
    });

    test('should throw exception when configuring if there is no appId present',
        () async {
      final config0 = AmplifyConfig.fromJson(
        jsonDecode(noPushAppIdAmplifyConfig) as Map<String, Object?>,
      );
      expect(
        () async => plugin.configure(
          authProviderRepo: authProviderRepo,
          config: config0,
        ),
        throwsA(const TypeMatcher<PushNotificationException>()),
      );
    });

    test('should fail configure when registering device is unsuccessfull',
        () async {
      log.clear();
      testWidgetsFlutterBinding.defaultBinaryMessenger.setMockMethodCallHandler(
        MethodChannel(tokenReceivedEventChannel.name),
        throwErrorHandler,
      );
      expect(
        () async => plugin.configure(
          authProviderRepo: authProviderRepo,
          config: config,
        ),
        throwsA(const TypeMatcher<PushNotificationException>()),
      );
    });

    test(
        'should throw Exception when token, foreground and notificaiton opened API are called before configuration',
        () async {
      expect(
        () async => plugin.onTokenReceived,
        throwsA(const TypeMatcher<PushNotificationException>()),
      );
    });
  });
}


// TODO: test PushNotification.fromJson
// TODO: Test flutterAPI
// TODO: Test overrriden API methods by stubbing native calls
