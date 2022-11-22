// Generated with smithy-dart 0.3.0. DO NOT MODIFY.

library amplify_logging_dart.cloud_watch_logs.model.unrecognized_client_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'unrecognized_client_exception.g.dart';

/// The most likely cause is an invalid Amazon Web Services access key ID or secret key.
abstract class UnrecognizedClientException
    with _i1.AWSEquatable<UnrecognizedClientException>
    implements
        Built<UnrecognizedClientException, UnrecognizedClientExceptionBuilder>,
        _i2.SmithyHttpException {
  /// The most likely cause is an invalid Amazon Web Services access key ID or secret key.
  factory UnrecognizedClientException({String? message}) {
    return _$UnrecognizedClientException._(message: message);
  }

  /// The most likely cause is an invalid Amazon Web Services access key ID or secret key.
  factory UnrecognizedClientException.build(
          [void Function(UnrecognizedClientExceptionBuilder) updates]) =
      _$UnrecognizedClientException;

  const UnrecognizedClientException._();

  /// Constructs a [UnrecognizedClientException] from a [payload] and [response].
  factory UnrecognizedClientException.fromResponse(
    UnrecognizedClientException payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.statusCode = response.statusCode;
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    UnrecognizedClientExceptionAwsJson11Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UnrecognizedClientExceptionBuilder b) {}
  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.cloudwatchlogs',
        shape: 'UnrecognizedClientException',
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
    final helper = newBuiltValueToStringHelper('UnrecognizedClientException');
    helper.add(
      'message',
      message,
    );
    return helper.toString();
  }
}

class UnrecognizedClientExceptionAwsJson11Serializer
    extends _i2.StructuredSmithySerializer<UnrecognizedClientException> {
  const UnrecognizedClientExceptionAwsJson11Serializer()
      : super('UnrecognizedClientException');

  @override
  Iterable<Type> get types => const [
        UnrecognizedClientException,
        _$UnrecognizedClientException,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_1',
        )
      ];
  @override
  UnrecognizedClientException deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnrecognizedClientExceptionBuilder();
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
    final payload = (object as UnrecognizedClientException);
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
