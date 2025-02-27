// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.config_service.model.too_many_tags_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'too_many_tags_exception.g.dart';

/// You have reached the limit of the number of tags you can use. You have more than 50 tags.
abstract class TooManyTagsException
    with _i1.AWSEquatable<TooManyTagsException>
    implements
        Built<TooManyTagsException, TooManyTagsExceptionBuilder>,
        _i2.SmithyHttpException {
  /// You have reached the limit of the number of tags you can use. You have more than 50 tags.
  factory TooManyTagsException({String? message}) {
    return _$TooManyTagsException._(message: message);
  }

  /// You have reached the limit of the number of tags you can use. You have more than 50 tags.
  factory TooManyTagsException.build(
          [void Function(TooManyTagsExceptionBuilder) updates]) =
      _$TooManyTagsException;

  const TooManyTagsException._();

  /// Constructs a [TooManyTagsException] from a [payload] and [response].
  factory TooManyTagsException.fromResponse(
    TooManyTagsException payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.statusCode = response.statusCode;
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    TooManyTagsExceptionAwsJson11Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TooManyTagsExceptionBuilder b) {}

  /// Error executing the command
  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.configservice',
        shape: 'TooManyTagsException',
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
    final helper = newBuiltValueToStringHelper('TooManyTagsException');
    helper.add(
      'message',
      message,
    );
    return helper.toString();
  }
}

class TooManyTagsExceptionAwsJson11Serializer
    extends _i2.StructuredSmithySerializer<TooManyTagsException> {
  const TooManyTagsExceptionAwsJson11Serializer()
      : super('TooManyTagsException');

  @override
  Iterable<Type> get types => const [
        TooManyTagsException,
        _$TooManyTagsException,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_1',
        )
      ];
  @override
  TooManyTagsException deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TooManyTagsExceptionBuilder();
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
    final payload = (object as TooManyTagsException);
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
