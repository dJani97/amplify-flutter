// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library rest_xml_v1.rest_xml_protocol.model.xml_timestamps_input_output; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

part 'xml_timestamps_input_output.g.dart';

abstract class XmlTimestampsInputOutput
    with
        _i1.HttpInput<XmlTimestampsInputOutput>,
        _i2.AWSEquatable<XmlTimestampsInputOutput>
    implements
        Built<XmlTimestampsInputOutput, XmlTimestampsInputOutputBuilder> {
  factory XmlTimestampsInputOutput({
    DateTime? dateTime,
    DateTime? dateTimeOnTarget,
    DateTime? epochSeconds,
    DateTime? epochSecondsOnTarget,
    DateTime? httpDate,
    DateTime? httpDateOnTarget,
    DateTime? normal,
  }) {
    return _$XmlTimestampsInputOutput._(
      dateTime: dateTime,
      dateTimeOnTarget: dateTimeOnTarget,
      epochSeconds: epochSeconds,
      epochSecondsOnTarget: epochSecondsOnTarget,
      httpDate: httpDate,
      httpDateOnTarget: httpDateOnTarget,
      normal: normal,
    );
  }

  factory XmlTimestampsInputOutput.build(
          [void Function(XmlTimestampsInputOutputBuilder) updates]) =
      _$XmlTimestampsInputOutput;

  const XmlTimestampsInputOutput._();

  factory XmlTimestampsInputOutput.fromRequest(
    XmlTimestampsInputOutput payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      payload;

  /// Constructs a [XmlTimestampsInputOutput] from a [payload] and [response].
  factory XmlTimestampsInputOutput.fromResponse(
    XmlTimestampsInputOutput payload,
    _i2.AWSBaseHttpResponse response,
  ) =>
      payload;

  static const List<_i1.SmithySerializer> serializers = [
    XmlTimestampsInputOutputRestXmlSerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(XmlTimestampsInputOutputBuilder b) {}
  DateTime? get dateTime;
  DateTime? get dateTimeOnTarget;
  DateTime? get epochSeconds;
  DateTime? get epochSecondsOnTarget;
  DateTime? get httpDate;
  DateTime? get httpDateOnTarget;
  DateTime? get normal;
  @override
  XmlTimestampsInputOutput getPayload() => this;
  @override
  List<Object?> get props => [
        dateTime,
        dateTimeOnTarget,
        epochSeconds,
        epochSecondsOnTarget,
        httpDate,
        httpDateOnTarget,
        normal,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('XmlTimestampsInputOutput');
    helper.add(
      'dateTime',
      dateTime,
    );
    helper.add(
      'dateTimeOnTarget',
      dateTimeOnTarget,
    );
    helper.add(
      'epochSeconds',
      epochSeconds,
    );
    helper.add(
      'epochSecondsOnTarget',
      epochSecondsOnTarget,
    );
    helper.add(
      'httpDate',
      httpDate,
    );
    helper.add(
      'httpDateOnTarget',
      httpDateOnTarget,
    );
    helper.add(
      'normal',
      normal,
    );
    return helper.toString();
  }
}

class XmlTimestampsInputOutputRestXmlSerializer
    extends _i1.StructuredSmithySerializer<XmlTimestampsInputOutput> {
  const XmlTimestampsInputOutputRestXmlSerializer()
      : super('XmlTimestampsInputOutput');

  @override
  Iterable<Type> get types => const [
        XmlTimestampsInputOutput,
        _$XmlTimestampsInputOutput,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restXml',
        )
      ];
  @override
  XmlTimestampsInputOutput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = XmlTimestampsInputOutputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current;
      iterator.moveNext();
      final value = iterator.current;
      switch (key as String) {
        case 'dateTime':
          if (value != null) {
            result.dateTime = _i1.TimestampSerializer.dateTime.deserialize(
              serializers,
              value,
            );
          }
          break;
        case 'dateTimeOnTarget':
          if (value != null) {
            result.dateTimeOnTarget =
                _i1.TimestampSerializer.dateTime.deserialize(
              serializers,
              value,
            );
          }
          break;
        case 'epochSeconds':
          if (value != null) {
            result.epochSeconds =
                _i1.TimestampSerializer.epochSeconds.deserialize(
              serializers,
              value,
            );
          }
          break;
        case 'epochSecondsOnTarget':
          if (value != null) {
            result.epochSecondsOnTarget =
                _i1.TimestampSerializer.epochSeconds.deserialize(
              serializers,
              value,
            );
          }
          break;
        case 'httpDate':
          if (value != null) {
            result.httpDate = _i1.TimestampSerializer.httpDate.deserialize(
              serializers,
              value,
            );
          }
          break;
        case 'httpDateOnTarget':
          if (value != null) {
            result.httpDateOnTarget =
                _i1.TimestampSerializer.httpDate.deserialize(
              serializers,
              value,
            );
          }
          break;
        case 'normal':
          if (value != null) {
            result.normal = (serializers.deserialize(
              value,
              specifiedType: const FullType(DateTime),
            ) as DateTime);
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
    final payload = (object as XmlTimestampsInputOutput);
    final result = <Object?>[
      const _i1.XmlElementName('XmlTimestampsInputOutput')
    ];
    if (payload.dateTime != null) {
      result
        ..add(const _i1.XmlElementName('dateTime'))
        ..add(_i1.TimestampSerializer.dateTime.serialize(
          serializers,
          payload.dateTime!,
        ));
    }
    if (payload.dateTimeOnTarget != null) {
      result
        ..add(const _i1.XmlElementName('dateTimeOnTarget'))
        ..add(_i1.TimestampSerializer.dateTime.serialize(
          serializers,
          payload.dateTimeOnTarget!,
        ));
    }
    if (payload.epochSeconds != null) {
      result
        ..add(const _i1.XmlElementName('epochSeconds'))
        ..add(_i1.TimestampSerializer.epochSeconds.serialize(
          serializers,
          payload.epochSeconds!,
        ));
    }
    if (payload.epochSecondsOnTarget != null) {
      result
        ..add(const _i1.XmlElementName('epochSecondsOnTarget'))
        ..add(_i1.TimestampSerializer.epochSeconds.serialize(
          serializers,
          payload.epochSecondsOnTarget!,
        ));
    }
    if (payload.httpDate != null) {
      result
        ..add(const _i1.XmlElementName('httpDate'))
        ..add(_i1.TimestampSerializer.httpDate.serialize(
          serializers,
          payload.httpDate!,
        ));
    }
    if (payload.httpDateOnTarget != null) {
      result
        ..add(const _i1.XmlElementName('httpDateOnTarget'))
        ..add(_i1.TimestampSerializer.httpDate.serialize(
          serializers,
          payload.httpDateOnTarget!,
        ));
    }
    if (payload.normal != null) {
      result
        ..add(const _i1.XmlElementName('normal'))
        ..add(serializers.serialize(
          payload.normal!,
          specifiedType: const FullType.nullable(DateTime),
        ));
    }
    return result;
  }
}
