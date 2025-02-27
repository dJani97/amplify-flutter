// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

// ignore_for_file: unused_element
library rest_json1_v1.rest_json_protocol.test.constant_and_variable_query_string_operation_test_test; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/serializer.dart';
import 'package:rest_json1_v1/src/rest_json_protocol/model/constant_and_variable_query_string_input.dart'
    as _i5;
import 'package:rest_json1_v1/src/rest_json_protocol/operation/constant_and_variable_query_string_operation.dart'
    as _i3;
import 'package:smithy/smithy.dart' as _i4;
import 'package:smithy_test/smithy_test.dart' as _i2;
import 'package:test/test.dart' as _i1;

void main() {
  _i1.test(
    'RestJsonConstantAndVariableQueryStringMissingOneValue (request)',
    () async {
      await _i2.httpRequestTest(
        operation: _i3.ConstantAndVariableQueryStringOperation(
          region: 'us-east-1',
          baseUri: Uri.parse('https://example.com'),
        ),
        testCase: const _i2.HttpRequestTestCase(
          id: 'RestJsonConstantAndVariableQueryStringMissingOneValue',
          documentation: 'Mixes constant and variable query string parameters',
          protocol: _i4.ShapeId(
            namespace: 'aws.protocols',
            shape: 'restJson1',
          ),
          authScheme: null,
          body: '',
          bodyMediaType: null,
          params: {'baz': 'bam'},
          vendorParamsShape: null,
          vendorParams: {},
          headers: {},
          forbidHeaders: [],
          requireHeaders: [],
          tags: [],
          appliesTo: null,
          method: 'GET',
          uri: '/ConstantAndVariableQueryString',
          host: null,
          resolvedHost: null,
          queryParams: [
            'foo=bar',
            'baz=bam',
          ],
          forbidQueryParams: ['maybeSet'],
          requireQueryParams: [],
        ),
        inputSerializers: const [
          ConstantAndVariableQueryStringInputRestJson1Serializer()
        ],
      );
    },
  );
  _i1.test(
    'RestJsonConstantAndVariableQueryStringAllValues (request)',
    () async {
      await _i2.httpRequestTest(
        operation: _i3.ConstantAndVariableQueryStringOperation(
          region: 'us-east-1',
          baseUri: Uri.parse('https://example.com'),
        ),
        testCase: const _i2.HttpRequestTestCase(
          id: 'RestJsonConstantAndVariableQueryStringAllValues',
          documentation: 'Mixes constant and variable query string parameters',
          protocol: _i4.ShapeId(
            namespace: 'aws.protocols',
            shape: 'restJson1',
          ),
          authScheme: null,
          body: '',
          bodyMediaType: null,
          params: {
            'baz': 'bam',
            'maybeSet': 'yes',
          },
          vendorParamsShape: null,
          vendorParams: {},
          headers: {},
          forbidHeaders: [],
          requireHeaders: [],
          tags: [],
          appliesTo: null,
          method: 'GET',
          uri: '/ConstantAndVariableQueryString',
          host: null,
          resolvedHost: null,
          queryParams: [
            'foo=bar',
            'baz=bam',
            'maybeSet=yes',
          ],
          forbidQueryParams: [],
          requireQueryParams: [],
        ),
        inputSerializers: const [
          ConstantAndVariableQueryStringInputRestJson1Serializer()
        ],
      );
    },
  );
}

class ConstantAndVariableQueryStringInputRestJson1Serializer extends _i4
    .StructuredSmithySerializer<_i5.ConstantAndVariableQueryStringInput> {
  const ConstantAndVariableQueryStringInputRestJson1Serializer()
      : super('ConstantAndVariableQueryStringInput');

  @override
  Iterable<Type> get types => const [_i5.ConstantAndVariableQueryStringInput];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  _i5.ConstantAndVariableQueryStringInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = _i5.ConstantAndVariableQueryStringInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'baz':
          if (value != null) {
            result.baz = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'maybeSet':
          if (value != null) {
            result.maybeSet = (serializers.deserialize(
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
    throw StateError('Not supported for tests');
  }
}
