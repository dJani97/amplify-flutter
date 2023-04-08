// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library aws_query_v1.query_protocol.model.file_config_settings; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:aws_query_v1/src/query_protocol/model/retry_mode.dart' as _i3;
import 'package:aws_query_v1/src/query_protocol/model/s3_config.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'file_config_settings.g.dart';

/// Config settings that can be set in the AWS config / credentials file as part of a profile.
abstract class FileConfigSettings
    with _i1.AWSEquatable<FileConfigSettings>
    implements Built<FileConfigSettings, FileConfigSettingsBuilder> {
  /// Config settings that can be set in the AWS config / credentials file as part of a profile.
  factory FileConfigSettings({
    String? awsAccessKeyId,
    String? awsSecretAccessKey,
    String? awsSessionToken,
    String? region,
    _i2.S3Config? s3,
    _i3.RetryMode? retryMode,
    int? maxAttempts,
  }) {
    return _$FileConfigSettings._(
      awsAccessKeyId: awsAccessKeyId,
      awsSecretAccessKey: awsSecretAccessKey,
      awsSessionToken: awsSessionToken,
      region: region,
      s3: s3,
      retryMode: retryMode,
      maxAttempts: maxAttempts,
    );
  }

  /// Config settings that can be set in the AWS config / credentials file as part of a profile.
  factory FileConfigSettings.build(
          [void Function(FileConfigSettingsBuilder) updates]) =
      _$FileConfigSettings;

  const FileConfigSettings._();

  static const List<_i4.SmithySerializer> serializers = [
    FileConfigSettingsAwsQuerySerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(FileConfigSettingsBuilder b) {}
  String? get awsAccessKeyId;
  String? get awsSecretAccessKey;
  String? get awsSessionToken;
  String? get region;

  /// Configuration specific to S3.
  _i2.S3Config? get s3;

  /// Controls the strategy used for retries.
  _i3.RetryMode? get retryMode;
  int? get maxAttempts;
  @override
  List<Object?> get props => [
        awsAccessKeyId,
        awsSecretAccessKey,
        awsSessionToken,
        region,
        s3,
        retryMode,
        maxAttempts,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('FileConfigSettings');
    helper.add(
      'awsAccessKeyId',
      awsAccessKeyId,
    );
    helper.add(
      'awsSecretAccessKey',
      awsSecretAccessKey,
    );
    helper.add(
      'awsSessionToken',
      awsSessionToken,
    );
    helper.add(
      'region',
      region,
    );
    helper.add(
      's3',
      s3,
    );
    helper.add(
      'retryMode',
      retryMode,
    );
    helper.add(
      'maxAttempts',
      maxAttempts,
    );
    return helper.toString();
  }
}

class FileConfigSettingsAwsQuerySerializer
    extends _i4.StructuredSmithySerializer<FileConfigSettings> {
  const FileConfigSettingsAwsQuerySerializer() : super('FileConfigSettings');

  @override
  Iterable<Type> get types => const [
        FileConfigSettings,
        _$FileConfigSettings,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ];
  @override
  FileConfigSettings deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FileConfigSettingsBuilder();
    final responseIterator = serialized.iterator;
    while (responseIterator.moveNext()) {
      final key = responseIterator.current as String;
      responseIterator.moveNext();
      if (key.endsWith('Result')) {
        serialized = responseIterator.current as Iterable;
      }
    }
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current;
      iterator.moveNext();
      final value = iterator.current;
      switch (key as String) {
        case 'aws_access_key_id':
          if (value != null) {
            result.awsAccessKeyId = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'aws_secret_access_key':
          if (value != null) {
            result.awsSecretAccessKey = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'aws_session_token':
          if (value != null) {
            result.awsSessionToken = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'region':
          if (value != null) {
            result.region = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 's3':
          if (value != null) {
            result.s3.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(_i2.S3Config),
            ) as _i2.S3Config));
          }
          break;
        case 'retry_mode':
          if (value != null) {
            result.retryMode = (serializers.deserialize(
              value,
              specifiedType: const FullType(_i3.RetryMode),
            ) as _i3.RetryMode);
          }
          break;
        case 'max_attempts':
          if (value != null) {
            result.maxAttempts = (serializers.deserialize(
              value,
              specifiedType: const FullType(int),
            ) as int);
          }
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = (object as FileConfigSettings);
    final result = <Object?>[
      const _i4.XmlElementName(
        'FileConfigSettingsResponse',
        _i4.XmlNamespace('https://example.com/'),
      )
    ];
    if (payload.awsAccessKeyId != null) {
      result
        ..add(const _i4.XmlElementName('aws_access_key_id'))
        ..add(serializers.serialize(
          payload.awsAccessKeyId!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.awsSecretAccessKey != null) {
      result
        ..add(const _i4.XmlElementName('aws_secret_access_key'))
        ..add(serializers.serialize(
          payload.awsSecretAccessKey!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.awsSessionToken != null) {
      result
        ..add(const _i4.XmlElementName('aws_session_token'))
        ..add(serializers.serialize(
          payload.awsSessionToken!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.region != null) {
      result
        ..add(const _i4.XmlElementName('region'))
        ..add(serializers.serialize(
          payload.region!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.s3 != null) {
      result
        ..add(const _i4.XmlElementName('s3'))
        ..add(serializers.serialize(
          payload.s3!,
          specifiedType: const FullType(_i2.S3Config),
        ));
    }
    if (payload.retryMode != null) {
      result
        ..add(const _i4.XmlElementName('retry_mode'))
        ..add(serializers.serialize(
          payload.retryMode!,
          specifiedType: const FullType.nullable(_i3.RetryMode),
        ));
    }
    if (payload.maxAttempts != null) {
      result
        ..add(const _i4.XmlElementName('max_attempts'))
        ..add(serializers.serialize(
          payload.maxAttempts!,
          specifiedType: const FullType.nullable(int),
        ));
    }
    return result;
  }
}
