// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library rest_xml_with_namespace_v2.rest_xml_protocol_namespace.model.scoped_config; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i6;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rest_xml_with_namespace_v2/src/rest_xml_protocol_namespace/model/client_config.dart'
    as _i2;
import 'package:rest_xml_with_namespace_v2/src/rest_xml_protocol_namespace/model/environment_config.dart'
    as _i4;
import 'package:rest_xml_with_namespace_v2/src/rest_xml_protocol_namespace/model/file_config_settings.dart'
    as _i3;
import 'package:rest_xml_with_namespace_v2/src/rest_xml_protocol_namespace/model/operation_config.dart'
    as _i5;
import 'package:smithy/smithy.dart' as _i7;

part 'scoped_config.g.dart';

/// Config settings that are scoped to different sources, such as environment variables or the AWS config file.
abstract class ScopedConfig
    with _i1.AWSEquatable<ScopedConfig>
    implements Built<ScopedConfig, ScopedConfigBuilder> {
  /// Config settings that are scoped to different sources, such as environment variables or the AWS config file.
  factory ScopedConfig({
    _i2.ClientConfig? client,
    Map<String, _i3.FileConfigSettings>? configFile,
    Map<String, _i3.FileConfigSettings>? credentialsFile,
    _i4.EnvironmentConfig? environment,
    _i5.OperationConfig? operation,
  }) {
    return _$ScopedConfig._(
      client: client,
      configFile: configFile == null ? null : _i6.BuiltMap(configFile),
      credentialsFile:
          credentialsFile == null ? null : _i6.BuiltMap(credentialsFile),
      environment: environment,
      operation: operation,
    );
  }

  /// Config settings that are scoped to different sources, such as environment variables or the AWS config file.
  factory ScopedConfig.build([void Function(ScopedConfigBuilder) updates]) =
      _$ScopedConfig;

  const ScopedConfig._();

  static const List<_i7.SmithySerializer> serializers = [
    ScopedConfigRestXmlSerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ScopedConfigBuilder b) {}

  /// Configuration that is set on the constructed client.
  _i2.ClientConfig? get client;

  /// A shape representing a parsed config file, which is a map of profile names to configuration sets.
  _i6.BuiltMap<String, _i3.FileConfigSettings>? get configFile;

  /// A shape representing a parsed config file, which is a map of profile names to configuration sets.
  _i6.BuiltMap<String, _i3.FileConfigSettings>? get credentialsFile;

  /// Config settings that can be set as environment variables.
  _i4.EnvironmentConfig? get environment;

  /// Configuration that is set for the scope of a single operation.
  _i5.OperationConfig? get operation;
  @override
  List<Object?> get props => [
        client,
        configFile,
        credentialsFile,
        environment,
        operation,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ScopedConfig');
    helper.add(
      'client',
      client,
    );
    helper.add(
      'configFile',
      configFile,
    );
    helper.add(
      'credentialsFile',
      credentialsFile,
    );
    helper.add(
      'environment',
      environment,
    );
    helper.add(
      'operation',
      operation,
    );
    return helper.toString();
  }
}

class ScopedConfigRestXmlSerializer
    extends _i7.StructuredSmithySerializer<ScopedConfig> {
  const ScopedConfigRestXmlSerializer() : super('ScopedConfig');

  @override
  Iterable<Type> get types => const [
        ScopedConfig,
        _$ScopedConfig,
      ];
  @override
  Iterable<_i7.ShapeId> get supportedProtocols => const [
        _i7.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restXml',
        )
      ];
  @override
  ScopedConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScopedConfigBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current;
      iterator.moveNext();
      final value = iterator.current;
      switch (key as String) {
        case 'client':
          if (value != null) {
            result.client.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(_i2.ClientConfig),
            ) as _i2.ClientConfig));
          }
          break;
        case 'configFile':
          if (value != null) {
            result.configFile
                .replace(const _i7.XmlBuiltMapSerializer().deserialize(
              serializers,
              (value as Iterable<Object?>),
              specifiedType: const FullType(
                _i6.BuiltMap,
                [
                  FullType(String),
                  FullType(_i3.FileConfigSettings),
                ],
              ),
            ));
          }
          break;
        case 'credentialsFile':
          if (value != null) {
            result.credentialsFile
                .replace(const _i7.XmlBuiltMapSerializer().deserialize(
              serializers,
              (value as Iterable<Object?>),
              specifiedType: const FullType(
                _i6.BuiltMap,
                [
                  FullType(String),
                  FullType(_i3.FileConfigSettings),
                ],
              ),
            ));
          }
          break;
        case 'environment':
          if (value != null) {
            result.environment.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(_i4.EnvironmentConfig),
            ) as _i4.EnvironmentConfig));
          }
          break;
        case 'operation':
          if (value != null) {
            result.operation.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(_i5.OperationConfig),
            ) as _i5.OperationConfig));
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
    final payload = (object as ScopedConfig);
    final result = <Object?>[
      const _i7.XmlElementName(
        'ScopedConfig',
        _i7.XmlNamespace('https://example.com'),
      )
    ];
    if (payload.client != null) {
      result
        ..add(const _i7.XmlElementName('client'))
        ..add(serializers.serialize(
          payload.client!,
          specifiedType: const FullType(_i2.ClientConfig),
        ));
    }
    if (payload.configFile != null) {
      result
        ..add(const _i7.XmlElementName('configFile'))
        ..add(const _i7.XmlBuiltMapSerializer().serialize(
          serializers,
          payload.configFile!,
          specifiedType: const FullType.nullable(
            _i6.BuiltMap,
            [
              FullType(String),
              FullType(_i3.FileConfigSettings),
            ],
          ),
        ));
    }
    if (payload.credentialsFile != null) {
      result
        ..add(const _i7.XmlElementName('credentialsFile'))
        ..add(const _i7.XmlBuiltMapSerializer().serialize(
          serializers,
          payload.credentialsFile!,
          specifiedType: const FullType.nullable(
            _i6.BuiltMap,
            [
              FullType(String),
              FullType(_i3.FileConfigSettings),
            ],
          ),
        ));
    }
    if (payload.environment != null) {
      result
        ..add(const _i7.XmlElementName('environment'))
        ..add(serializers.serialize(
          payload.environment!,
          specifiedType: const FullType(_i4.EnvironmentConfig),
        ));
    }
    if (payload.operation != null) {
      result
        ..add(const _i7.XmlElementName('operation'))
        ..add(serializers.serialize(
          payload.operation!,
          specifiedType: const FullType(_i5.OperationConfig),
        ));
    }
    return result;
  }
}
