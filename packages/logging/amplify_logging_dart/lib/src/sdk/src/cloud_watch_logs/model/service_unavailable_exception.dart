// Generated with smithy-dart 0.3.0. DO NOT MODIFY.

library amplify_logging_dart.cloud_watch_logs.model.service_unavailable_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'service_unavailable_exception.g.dart';

/// The service cannot complete the request.
abstract class ServiceUnavailableException
    with _i1.AWSEquatable<ServiceUnavailableException>
    implements
        Built<ServiceUnavailableException, ServiceUnavailableExceptionBuilder>,
        _i2.SmithyHttpException {
  /// The service cannot complete the request.
  factory ServiceUnavailableException({String? message}) {
    return _$ServiceUnavailableException._(message: message);
  }

  /// The service cannot complete the request.
  factory ServiceUnavailableException.build(
          [void Function(ServiceUnavailableExceptionBuilder) updates]) =
      _$ServiceUnavailableException;

  const ServiceUnavailableException._();

  /// Constructs a [ServiceUnavailableException] from a [payload] and [response].
  factory ServiceUnavailableException.fromResponse(
    ServiceUnavailableException payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.statusCode = response.statusCode;
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    ServiceUnavailableExceptionAwsJson11Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ServiceUnavailableExceptionBuilder b) {}
  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.cloudwatchlogs',
        shape: 'ServiceUnavailableException',
      );
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int? get statusCode;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ServiceUnavailableException');
    helper.add(
      'message',
      message,
    );
    return helper.toString();
  }
}

class ServiceUnavailableExceptionAwsJson11Serializer
    extends _i2.StructuredSmithySerializer<ServiceUnavailableException> {
  const ServiceUnavailableExceptionAwsJson11Serializer()
      : super('ServiceUnavailableException');

  @override
  Iterable<Type> get types => const [
        ServiceUnavailableException,
        _$ServiceUnavailableException,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_1',
        )
      ];
  @override
  ServiceUnavailableException deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServiceUnavailableExceptionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'message':
          if (value != null) {
            result.message = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
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
    final payload = (object as ServiceUnavailableException);
    final result = <Object?>[];
    if (payload.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(
          payload.message!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}
