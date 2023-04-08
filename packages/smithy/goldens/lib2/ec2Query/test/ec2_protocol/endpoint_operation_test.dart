// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

// ignore_for_file: unused_element
library ec2_query_v2.ec2_protocol.test.endpoint_operation_test_test; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ec2_query_v2/src/ec2_protocol/operation/endpoint_operation.dart'
    as _i3;
import 'package:smithy/smithy.dart' as _i4;
import 'package:smithy_test/smithy_test.dart' as _i2;
import 'package:test/test.dart' as _i1;

void main() {
  _i1.test(
    'Ec2QueryEndpointTrait (request)',
    () async {
      await _i2.httpRequestTest(
        operation: _i3.EndpointOperation(
          region: 'us-east-1',
          baseUri: Uri.parse('https://example.com'),
        ),
        testCase: const _i2.HttpRequestTestCase(
          id: 'Ec2QueryEndpointTrait',
          documentation:
              'Operations can prepend to the given host if they define the\nendpoint trait.',
          protocol: _i4.ShapeId(
            namespace: 'aws.protocols',
            shape: 'ec2Query',
          ),
          authScheme: null,
          body: 'Action=EndpointOperation&Version=2020-01-08',
          bodyMediaType: 'application/x-www-form-urlencoded',
          params: {},
          vendorParamsShape: null,
          vendorParams: {},
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          forbidHeaders: [],
          requireHeaders: [],
          tags: [],
          appliesTo: null,
          method: 'POST',
          uri: '/',
          host: 'example.com',
          resolvedHost: 'foo.example.com',
          queryParams: [],
          forbidQueryParams: [],
          requireQueryParams: [],
        ),
        inputSerializers: const [],
      );
    },
  );
}
