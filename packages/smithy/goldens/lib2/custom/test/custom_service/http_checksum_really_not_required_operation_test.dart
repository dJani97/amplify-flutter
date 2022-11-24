// Generated with smithy-dart 0.1.1. DO NOT MODIFY.

// ignore_for_file: unused_element
library custom_v2.custom_service.test.http_checksum_really_not_required_operation_test_test; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:typed_data' as _i6;

import 'package:built_value/serializer.dart';
import 'package:custom_v2/src/custom_service/model/http_checksum_really_not_required_input.dart'
    as _i5;
import 'package:custom_v2/src/custom_service/operation/http_checksum_really_not_required_operation.dart'
    as _i3;
import 'package:smithy/smithy.dart' as _i4;
import 'package:smithy_test/smithy_test.dart' as _i2;
import 'package:test/test.dart' as _i1;

void main() {
  _i1.test(
    'HttpChecksumReallyNotRequiredNoAlgorithm (request)',
    () async {
      await _i2.httpRequestTest(
        operation: _i3.HttpChecksumReallyNotRequiredOperation(
          region: 'us-east-1',
          baseUri: Uri.parse('https://example.com'),
        ),
        testCase: const _i2.HttpRequestTestCase(
          id: 'HttpChecksumReallyNotRequiredNoAlgorithm',
          documentation:
              'Adds no checksum since @httpChecksumRequired supercedes @httpChecksum',
          protocol: _i4.ShapeId(
            namespace: 'aws.protocols',
            shape: 'restJson1',
          ),
          authScheme: null,
          body: 'hello, world',
          bodyMediaType: 'application/octet-stream',
          params: {'content': 'hello, world'},
          vendorParamsShape: null,
          vendorParams: {},
          headers: {
            'Content-Type': 'application/octet-stream',
            'Content-MD5': '5NfxtO0uQtFYmPSyewGdpA==',
          },
          forbidHeaders: ['x-amz-request-algorithm'],
          requireHeaders: [],
          tags: [],
          appliesTo: null,
          method: 'POST',
          uri: '/reallyNotRequired',
          host: null,
          resolvedHost: null,
          queryParams: [],
          forbidQueryParams: [],
          requireQueryParams: [],
        ),
        inputSerializers: const [
          HttpChecksumReallyNotRequiredInputRestJson1Serializer()
        ],
      );
    },
  );
}

class HttpChecksumReallyNotRequiredInputRestJson1Serializer extends _i4
    .StructuredSmithySerializer<_i5.HttpChecksumReallyNotRequiredInput> {
  const HttpChecksumReallyNotRequiredInputRestJson1Serializer()
      : super('HttpChecksumReallyNotRequiredInput');

  @override
  Iterable<Type> get types => const [_i5.HttpChecksumReallyNotRequiredInput];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  _i5.HttpChecksumReallyNotRequiredInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = _i5.HttpChecksumReallyNotRequiredInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'content':
          if (value != null) {
            result.content = (serializers.deserialize(
              value,
              specifiedType: const FullType(_i6.Uint8List),
            ) as _i6.Uint8List);
          }
          break;
      }
    }

    result.content ??= _i6.Uint8List(0);
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
