// Generated with smithy-dart 0.3.0. DO NOT MODIFY.

library amplify_logging_dart.x_ray.model.untag_resource_request; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

part 'untag_resource_request.g.dart';

abstract class UntagResourceRequest
    with
        _i1.HttpInput<UntagResourceRequest>,
        _i2.AWSEquatable<UntagResourceRequest>
    implements Built<UntagResourceRequest, UntagResourceRequestBuilder> {
  factory UntagResourceRequest({
    required String resourceArn,
    required List<String> tagKeys,
  }) {
    return _$UntagResourceRequest._(
      resourceArn: resourceArn,
      tagKeys: _i3.BuiltList(tagKeys),
    );
  }

  factory UntagResourceRequest.build(
          [void Function(UntagResourceRequestBuilder) updates]) =
      _$UntagResourceRequest;

  const UntagResourceRequest._();

  factory UntagResourceRequest.fromRequest(
    UntagResourceRequest payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      payload;

  static const List<_i1.SmithySerializer> serializers = [
    UntagResourceRequestRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UntagResourceRequestBuilder b) {}

  /// The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
  String get resourceArn;

  /// Keys for one or more tags that you want to remove from an X-Ray group or sampling rule.
  _i3.BuiltList<String> get tagKeys;
  @override
  UntagResourceRequest getPayload() => this;
  @override
  List<Object?> get props => [
        resourceArn,
        tagKeys,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('UntagResourceRequest');
    helper.add(
      'resourceArn',
      resourceArn,
    );
    helper.add(
      'tagKeys',
      tagKeys,
    );
    return helper.toString();
  }
}

class UntagResourceRequestRestJson1Serializer
    extends _i1.StructuredSmithySerializer<UntagResourceRequest> {
  const UntagResourceRequestRestJson1Serializer()
      : super('UntagResourceRequest');

  @override
  Iterable<Type> get types => const [
        UntagResourceRequest,
        _$UntagResourceRequest,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  UntagResourceRequest deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UntagResourceRequestBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ResourceARN':
          result.resourceArn = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'TagKeys':
          result.tagKeys.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltList,
              [FullType(String)],
            ),
          ) as _i3.BuiltList<String>));
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
    final payload = (object as UntagResourceRequest);
    final result = <Object?>[
      'ResourceARN',
      serializers.serialize(
        payload.resourceArn,
        specifiedType: const FullType(String),
      ),
      'TagKeys',
      serializers.serialize(
        payload.tagKeys,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(String)],
        ),
      ),
    ];
    return result;
  }
}
