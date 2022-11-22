// Generated with smithy-dart 0.3.0. DO NOT MODIFY.

library amplify_logging_dart.x_ray.operation.get_encryption_config_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i11;

import 'package:amplify_logging_dart/src/sdk/src/x_ray/common/endpoint_resolver.dart'
    as _i8;
import 'package:amplify_logging_dart/src/sdk/src/x_ray/common/serializers.dart'
    as _i6;
import 'package:amplify_logging_dart/src/sdk/src/x_ray/model/get_encryption_config_request.dart'
    as _i2;
import 'package:amplify_logging_dart/src/sdk/src/x_ray/model/get_encryption_config_result.dart'
    as _i3;
import 'package:amplify_logging_dart/src/sdk/src/x_ray/model/invalid_request_exception.dart'
    as _i9;
import 'package:amplify_logging_dart/src/sdk/src/x_ray/model/throttled_exception.dart'
    as _i10;
import 'package:aws_common/aws_common.dart' as _i7;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i5;

/// Retrieves the current encryption configuration for X-Ray data.
class GetEncryptionConfigOperation extends _i1.HttpOperation<
    _i2.GetEncryptionConfigRequest,
    _i2.GetEncryptionConfigRequest,
    _i3.GetEncryptionConfigResult,
    _i3.GetEncryptionConfigResult> {
  /// Retrieves the current encryption configuration for X-Ray data.
  GetEncryptionConfigOperation({
    required String region,
    Uri? baseUri,
    _i4.AWSCredentialsProvider credentialsProvider =
        const _i4.AWSCredentialsProvider.environment(),
  })  : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider;

  @override
  late final List<
      _i1.HttpProtocol<
          _i2.GetEncryptionConfigRequest,
          _i2.GetEncryptionConfigRequest,
          _i3.GetEncryptionConfigResult,
          _i3.GetEncryptionConfigResult>> protocols = [
    _i5.RestJson1Protocol(
      serializers: _i6.serializers,
      builderFactories: _i6.builderFactories,
      requestInterceptors: [
        const _i1.WithHost(),
        const _i1.WithNoHeader('Content-Length'),
        const _i1.WithNoHeader('Content-Type'),
        _i5.WithSigV4(
          region: _region,
          service: _i7.AWSService.xRay,
          credentialsProvider: _credentialsProvider,
        ),
        const _i1.WithUserAgent('aws-sdk-dart/0.3.0'),
        const _i5.WithSdkInvocationId(),
        const _i5.WithSdkRequest(),
      ],
      responseInterceptors: [],
    )
  ];

  late final _i5.AWSEndpoint _awsEndpoint = _i8.endpointResolver.resolve(
    _i8.sdkId,
    _region,
  );

  final String _region;

  final Uri? _baseUri;

  final _i4.AWSCredentialsProvider _credentialsProvider;

  @override
  _i1.HttpRequest buildRequest(_i2.GetEncryptionConfigRequest input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/EncryptionConfig';
      });
  @override
  int successCode([_i3.GetEncryptionConfigResult? output]) => 200;
  @override
  _i3.GetEncryptionConfigResult buildOutput(
    _i3.GetEncryptionConfigResult payload,
    _i7.AWSBaseHttpResponse response,
  ) =>
      _i3.GetEncryptionConfigResult.fromResponse(
        payload,
        response,
      );
  @override
  List<_i1.SmithyError> get errorTypes => const [
        _i1.SmithyError(
          _i1.ShapeId(
            namespace: 'com.amazonaws.xray',
            shape: 'InvalidRequestException',
          ),
          _i1.ErrorKind.client,
          _i9.InvalidRequestException,
          builder: _i9.InvalidRequestException.fromResponse,
        ),
        _i1.SmithyError(
          _i1.ShapeId(
            namespace: 'com.amazonaws.xray',
            shape: 'ThrottledException',
          ),
          _i1.ErrorKind.client,
          _i10.ThrottledException,
          statusCode: 429,
          builder: _i10.ThrottledException.fromResponse,
        ),
      ];
  @override
  String get runtimeTypeName => 'GetEncryptionConfig';
  @override
  _i5.AWSRetryer get retryer => _i5.AWSRetryer();
  @override
  Uri get baseUri => _baseUri ?? endpoint.uri;
  @override
  _i1.Endpoint get endpoint => _awsEndpoint.endpoint;
  @override
  _i1.SmithyOperation<_i3.GetEncryptionConfigResult> run(
    _i2.GetEncryptionConfigRequest input, {
    _i7.AWSHttpClient? client,
    _i1.ShapeId? useProtocol,
  }) {
    return _i11.runZoned(
      () => super.run(
        input,
        client: client,
        useProtocol: useProtocol,
      ),
      zoneValues: {
        ...?_awsEndpoint.credentialScope?.zoneValues,
        ...{_i7.AWSHeaders.sdkInvocationId: _i7.uuid(secure: true)}
      },
    );
  }
}
