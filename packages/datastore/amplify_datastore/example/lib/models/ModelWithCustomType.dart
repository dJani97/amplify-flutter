/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// This is an auto generated class representing the ModelWithCustomType type in your schema.
@immutable
class ModelWithCustomType extends Model {
  static const classType = _ModelWithCustomTypeModelType();
  final String id;
  final CustomTypeWithAppsyncScalarTypes? _customTypeValue;
  final List<CustomTypeWithAppsyncScalarTypes>? _listOfCustomTypeValue;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ModelWithCustomTypeModelIdentifier get modelIdentifier {
    return ModelWithCustomTypeModelIdentifier(id: id);
  }

  CustomTypeWithAppsyncScalarTypes? get customTypeValue {
    return _customTypeValue;
  }

  List<CustomTypeWithAppsyncScalarTypes>? get listOfCustomTypeValue {
    return _listOfCustomTypeValue;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const ModelWithCustomType._internal(
      {required this.id,
      customTypeValue,
      listOfCustomTypeValue,
      createdAt,
      updatedAt})
      : _customTypeValue = customTypeValue,
        _listOfCustomTypeValue = listOfCustomTypeValue,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory ModelWithCustomType(
      {String? id,
      CustomTypeWithAppsyncScalarTypes? customTypeValue,
      List<CustomTypeWithAppsyncScalarTypes>? listOfCustomTypeValue}) {
    return ModelWithCustomType._internal(
        id: id == null ? UUID.getUUID() : id,
        customTypeValue: customTypeValue,
        listOfCustomTypeValue: listOfCustomTypeValue != null
            ? List<CustomTypeWithAppsyncScalarTypes>.unmodifiable(
                listOfCustomTypeValue)
            : listOfCustomTypeValue);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelWithCustomType &&
        id == other.id &&
        _customTypeValue == other._customTypeValue &&
        DeepCollectionEquality()
            .equals(_listOfCustomTypeValue, other._listOfCustomTypeValue);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = StringBuffer();

    buffer.write("ModelWithCustomType {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("customTypeValue=" +
        (_customTypeValue != null ? _customTypeValue!.toString() : "null") +
        ", ");
    buffer.write("listOfCustomTypeValue=" +
        (_listOfCustomTypeValue != null
            ? _listOfCustomTypeValue!.toString()
            : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ModelWithCustomType copyWith(
      {CustomTypeWithAppsyncScalarTypes? customTypeValue,
      List<CustomTypeWithAppsyncScalarTypes>? listOfCustomTypeValue}) {
    return ModelWithCustomType._internal(
        id: id,
        customTypeValue: customTypeValue ?? this.customTypeValue,
        listOfCustomTypeValue:
            listOfCustomTypeValue ?? this.listOfCustomTypeValue);
  }

  ModelWithCustomType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _customTypeValue = json['customTypeValue']?['serializedData'] != null
            ? CustomTypeWithAppsyncScalarTypes.fromJson(
                Map<String, dynamic>.from(
                    json['customTypeValue']['serializedData']))
            : null,
        _listOfCustomTypeValue = json['listOfCustomTypeValue'] is List
            ? (json['listOfCustomTypeValue'] as List)
                .where((e) => e != null)
                .map((e) => CustomTypeWithAppsyncScalarTypes.fromJson(
                    Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'customTypeValue': _customTypeValue?.toJson(),
        'listOfCustomTypeValue': _listOfCustomTypeValue
            ?.map((CustomTypeWithAppsyncScalarTypes? e) => e?.toJson())
            .toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryModelIdentifier<ModelWithCustomTypeModelIdentifier>
      MODEL_IDENTIFIER =
      QueryModelIdentifier<ModelWithCustomTypeModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CUSTOMTYPEVALUE =
      QueryField(fieldName: "customTypeValue");
  static final QueryField LISTOFCUSTOMTYPEVALUE =
      QueryField(fieldName: "listOfCustomTypeValue");
  static var schema = Model.defineSchema(
      define: (ModelTypeDefinitionBuilder modelSchemaDefinition) {
    modelSchemaDefinition.name = "ModelWithCustomType";
    modelSchemaDefinition.pluralName = "ModelWithCustomTypes";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'customTypeValue',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'CustomTypeWithAppsyncScalarTypes')));

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'listOfCustomTypeValue',
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection,
            ofCustomTypeName: 'CustomTypeWithAppsyncScalarTypes')));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _ModelWithCustomTypeModelType extends ModelType<ModelWithCustomType> {
  const _ModelWithCustomTypeModelType();

  @override
  ModelWithCustomType fromJson(Map<String, dynamic> jsonData) {
    return ModelWithCustomType.fromJson(jsonData);
  }
}

/// This is an auto generated class representing the model identifier
/// of [ModelWithCustomType] in your schema.
@immutable
class ModelWithCustomTypeModelIdentifier
    implements ModelIdentifier<ModelWithCustomType> {
  final String id;

  /// Create an instance of ModelWithCustomTypeModelIdentifier using [id] the primary key.
  const ModelWithCustomTypeModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'ModelWithCustomTypeModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ModelWithCustomTypeModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
