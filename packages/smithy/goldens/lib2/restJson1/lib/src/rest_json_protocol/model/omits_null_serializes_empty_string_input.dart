// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library rest_json1_v2.rest_json_protocol.model.omits_null_serializes_empty_string_input; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i3;
import 'package:smithy/smithy.dart' as _i1;

part 'omits_null_serializes_empty_string_input.g.dart';

abstract class OmitsNullSerializesEmptyStringInput
    with
        _i1.HttpInput<OmitsNullSerializesEmptyStringInputPayload>,
        _i2.AWSEquatable<OmitsNullSerializesEmptyStringInput>
    implements
        Built<OmitsNullSerializesEmptyStringInput,
            OmitsNullSerializesEmptyStringInputBuilder>,
        _i1.EmptyPayload,
        _i1.HasPayload<OmitsNullSerializesEmptyStringInputPayload> {
  factory OmitsNullSerializesEmptyStringInput({
    String? emptyString,
    String? nullValue,
  }) {
    return _$OmitsNullSerializesEmptyStringInput._(
      emptyString: emptyString,
      nullValue: nullValue,
    );
  }

  factory OmitsNullSerializesEmptyStringInput.build(
          [void Function(OmitsNullSerializesEmptyStringInputBuilder) updates]) =
      _$OmitsNullSerializesEmptyStringInput;

  const OmitsNullSerializesEmptyStringInput._();

  factory OmitsNullSerializesEmptyStringInput.fromRequest(
    OmitsNullSerializesEmptyStringInputPayload payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      OmitsNullSerializesEmptyStringInput.build((b) {
        if (request.queryParameters['Null'] != null) {
          b.nullValue = request.queryParameters['Null']!;
        }
        if (request.queryParameters['Empty'] != null) {
          b.emptyString = request.queryParameters['Empty']!;
        }
      });

  static const List<_i1.SmithySerializer> serializers = [
    OmitsNullSerializesEmptyStringInputRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(OmitsNullSerializesEmptyStringInputBuilder b) {}
  String? get emptyString;
  String? get nullValue;
  @override
  OmitsNullSerializesEmptyStringInputPayload getPayload() =>
      OmitsNullSerializesEmptyStringInputPayload();
  @override
  List<Object?> get props => [
        emptyString,
        nullValue,
      ];
  @override
  String toString() {
    final helper =
        newBuiltValueToStringHelper('OmitsNullSerializesEmptyStringInput');
    helper.add(
      'emptyString',
      emptyString,
    );
    helper.add(
      'nullValue',
      nullValue,
    );
    return helper.toString();
  }
}

@_i3.internal
abstract class OmitsNullSerializesEmptyStringInputPayload
    with
        _i2.AWSEquatable<OmitsNullSerializesEmptyStringInputPayload>
    implements
        Built<OmitsNullSerializesEmptyStringInputPayload,
            OmitsNullSerializesEmptyStringInputPayloadBuilder>,
        _i1.EmptyPayload {
  factory OmitsNullSerializesEmptyStringInputPayload(
      [void Function(OmitsNullSerializesEmptyStringInputPayloadBuilder)
          updates]) = _$OmitsNullSerializesEmptyStringInputPayload;

  const OmitsNullSerializesEmptyStringInputPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(OmitsNullSerializesEmptyStringInputPayloadBuilder b) {}
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(
        'OmitsNullSerializesEmptyStringInputPayload');
    return helper.toString();
  }
}

class OmitsNullSerializesEmptyStringInputRestJson1Serializer extends _i1
    .StructuredSmithySerializer<OmitsNullSerializesEmptyStringInputPayload> {
  const OmitsNullSerializesEmptyStringInputRestJson1Serializer()
      : super('OmitsNullSerializesEmptyStringInput');

  @override
  Iterable<Type> get types => const [
        OmitsNullSerializesEmptyStringInput,
        _$OmitsNullSerializesEmptyStringInput,
        OmitsNullSerializesEmptyStringInputPayload,
        _$OmitsNullSerializesEmptyStringInputPayload,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  OmitsNullSerializesEmptyStringInputPayload deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return OmitsNullSerializesEmptyStringInputPayloadBuilder().build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      const <Object?>[];
}
