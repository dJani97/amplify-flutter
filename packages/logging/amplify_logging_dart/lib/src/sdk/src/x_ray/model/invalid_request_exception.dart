// Generated with smithy-dart 0.3.0. DO NOT MODIFY.

library amplify_logging_dart.x_ray.model.invalid_request_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'invalid_request_exception.g.dart';

/// The request is missing required parameters or has invalid parameters.
abstract class InvalidRequestException
    with _i1.AWSEquatable<InvalidRequestException>
    implements
        Built<InvalidRequestException, InvalidRequestExceptionBuilder>,
        _i2.SmithyHttpException {
  /// The request is missing required parameters or has invalid parameters.
  factory InvalidRequestException({String? message}) {
    return _$InvalidRequestException._(message: message);
  }

  /// The request is missing required parameters or has invalid parameters.
  factory InvalidRequestException.build(
          [void Function(InvalidRequestExceptionBuilder) updates]) =
      _$InvalidRequestException;

  const InvalidRequestException._();

  /// Constructs a [InvalidRequestException] from a [payload] and [response].
  factory InvalidRequestException.fromResponse(
    InvalidRequestException payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.statusCode = response.statusCode;
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    InvalidRequestExceptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(InvalidRequestExceptionBuilder b) {}
  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.xray',
        shape: 'InvalidRequestException',
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
    final helper = newBuiltValueToStringHelper('InvalidRequestException');
    helper.add(
      'message',
      message,
    );
    return helper.toString();
  }
}

class InvalidRequestExceptionRestJson1Serializer
    extends _i2.StructuredSmithySerializer<InvalidRequestException> {
  const InvalidRequestExceptionRestJson1Serializer()
      : super('InvalidRequestException');

  @override
  Iterable<Type> get types => const [
        InvalidRequestException,
        _$InvalidRequestException,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  InvalidRequestException deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvalidRequestExceptionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'Message':
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
    final payload = (object as InvalidRequestException);
    final result = <Object?>[];
    if (payload.message != null) {
      result
        ..add('Message')
        ..add(serializers.serialize(
          payload.message!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}
