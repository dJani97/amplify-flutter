// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.dynamo_db.model.list_exports_output; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;
import 'package:smoke_test/src/sdk/src/dynamo_db/model/export_summary.dart'
    as _i2;

part 'list_exports_output.g.dart';

abstract class ListExportsOutput
    with _i1.AWSEquatable<ListExportsOutput>
    implements Built<ListExportsOutput, ListExportsOutputBuilder> {
  factory ListExportsOutput({
    List<_i2.ExportSummary>? exportSummaries,
    String? nextToken,
  }) {
    return _$ListExportsOutput._(
      exportSummaries:
          exportSummaries == null ? null : _i3.BuiltList(exportSummaries),
      nextToken: nextToken,
    );
  }

  factory ListExportsOutput.build(
      [void Function(ListExportsOutputBuilder) updates]) = _$ListExportsOutput;

  const ListExportsOutput._();

  /// Constructs a [ListExportsOutput] from a [payload] and [response].
  factory ListExportsOutput.fromResponse(
    ListExportsOutput payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload;

  static const List<_i4.SmithySerializer> serializers = [
    ListExportsOutputAwsJson10Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ListExportsOutputBuilder b) {}

  /// A list of `ExportSummary` objects.
  _i3.BuiltList<_i2.ExportSummary>? get exportSummaries;

  /// If this value is returned, there are additional results to be displayed. To retrieve them, call `ListExports` again, with `NextToken` set to this value.
  String? get nextToken;
  @override
  List<Object?> get props => [
        exportSummaries,
        nextToken,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ListExportsOutput');
    helper.add(
      'exportSummaries',
      exportSummaries,
    );
    helper.add(
      'nextToken',
      nextToken,
    );
    return helper.toString();
  }
}

class ListExportsOutputAwsJson10Serializer
    extends _i4.StructuredSmithySerializer<ListExportsOutput> {
  const ListExportsOutputAwsJson10Serializer() : super('ListExportsOutput');

  @override
  Iterable<Type> get types => const [
        ListExportsOutput,
        _$ListExportsOutput,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_0',
        )
      ];
  @override
  ListExportsOutput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListExportsOutputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ExportSummaries':
          if (value != null) {
            result.exportSummaries.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(
                _i3.BuiltList,
                [FullType(_i2.ExportSummary)],
              ),
            ) as _i3.BuiltList<_i2.ExportSummary>));
          }
          break;
        case 'NextToken':
          if (value != null) {
            result.nextToken = (serializers.deserialize(
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
    final payload = (object as ListExportsOutput);
    final result = <Object?>[];
    if (payload.exportSummaries != null) {
      result
        ..add('ExportSummaries')
        ..add(serializers.serialize(
          payload.exportSummaries!,
          specifiedType: const FullType(
            _i3.BuiltList,
            [FullType(_i2.ExportSummary)],
          ),
        ));
    }
    if (payload.nextToken != null) {
      result
        ..add('NextToken')
        ..add(serializers.serialize(
          payload.nextToken!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}
