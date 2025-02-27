// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:convert/convert.dart';
import 'package:crclib/catalog.dart';
import 'package:crclib/crclib.dart';
import 'package:crypto/crypto.dart';
import 'package:smithy/smithy.dart';

class _CrcValueToHeaderConverter extends Converter<CrcValue, String> {
  const _CrcValueToHeaderConverter();

  @override
  String convert(CrcValue input) {
    return base64Encode(hex.decode(input.toRadixString(16)));
  }

  @override
  Sink<CrcValue> startChunkedConversion(Sink<String> sink) {
    return ChunkedConversionSink.withCallback(
      (value) => sink
        ..add(convert(value.last))
        ..close(),
    );
  }
}

class _DigestToHeaderConverter extends Converter<Digest, String> {
  const _DigestToHeaderConverter();

  @override
  String convert(Digest input) {
    return base64Encode(input.bytes);
  }

  @override
  Sink<Digest> startChunkedConversion(Sink<String> sink) {
    return ChunkedConversionSink.withCallback(
      (value) => sink
        ..add(convert(value.last))
        ..close(),
    );
  }
}

/// {@template smithy_aws.interceptors.with_checksum}
/// Intercepts HTTP requests to include a content hash in the headers.
///
/// See: https://awslabs.github.io/smithy/2.0/aws/aws-core.html#aws-protocols-httpchecksum-trait
/// {@endtemplate}
class WithChecksum extends HttpRequestInterceptor {
  /// {@macro smithy_aws.interceptors.with_checksum}
  const WithChecksum([String? algorithm]) : _algorithm = algorithm ?? 'MD5';

  final String _algorithm;

  // https://awslabs.github.io/smithy/2.0/aws/aws-core.html#resolving-checksum-name
  String get _header {
    switch (_algorithm) {
      case 'CRC32C':
      case 'CRC32':
      case 'SHA1':
      case 'SHA256':
        return 'x-amz-checksum-${_algorithm.toLowerCase()}';
      case 'MD5':
      default:
        return 'Content-MD5';
    }
  }

  static Converter<List<int>, String> _converterForAlgorithm(String algorithm) {
    switch (algorithm) {
      case 'CRC32C':
        return Crc32C().fuse(const _CrcValueToHeaderConverter());
      case 'CRC32':
        return Crc32().fuse(const _CrcValueToHeaderConverter());
      case 'SHA1':
        return sha1.fuse(const _DigestToHeaderConverter());
      case 'SHA256':
        return sha256.fuse(const _DigestToHeaderConverter());
      case 'MD5':
      default:
        return md5.fuse(const _DigestToHeaderConverter());
    }
  }

  @override
  Future<AWSBaseHttpRequest> intercept(
    AWSBaseHttpRequest request,
  ) async {
    if (request.headers.containsKey(_header)) {
      return request;
    }
    final digest =
        await _converterForAlgorithm(_algorithm).bind(request.split()).last;
    request.headers[_header] = digest;
    return request;
  }
}
