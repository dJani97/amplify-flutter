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

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:collection/collection.dart';

const _serializedData = 'serializedData';

/// "items", the key name for nested data in AppSync
const items = 'items';

class _RelatedFields {
  _RelatedFields(this.singleFields, this.hasManyFields);

  final Iterable<ModelField> singleFields;
  final Iterable<ModelField> hasManyFields;
}

_RelatedFields _getRelatedFieldsUncached(StructureTypeDefinition modelSchema) {
  final singleFields = modelSchema.fields.values.where((field) =>
      field.association?.associationType == ModelAssociationType.hasOne ||
      field.association?.associationType == ModelAssociationType.belongsTo ||
      field.type.asLegacyType.fieldType == ModelFieldTypeEnum.embedded ||
      field.type.asLegacyType.fieldType ==
          ModelFieldTypeEnum.embeddedCollection);
  final hasManyFields = modelSchema.fields.values.where((field) =>
      field.association?.associationType == ModelAssociationType.hasMany);

  return _RelatedFields(singleFields, hasManyFields);
}

final _fieldsMemo = <SchemaTypeDefinition, _RelatedFields>{};
// cached to avoid repeat iterations over fields in schema to get related fields
_RelatedFields _getRelatedFields(StructureTypeDefinition modelSchema) {
  if (_fieldsMemo[modelSchema] != null) {
    return _fieldsMemo[modelSchema]!;
  }
  final result = _getRelatedFieldsUncached(modelSchema);
  _fieldsMemo[modelSchema] = result;
  return _fieldsMemo[modelSchema]!;
}

ModelField? getBelongsToFieldFromModelSchema(
    StructureTypeDefinition modelSchema) {
  return _getRelatedFields(modelSchema).singleFields.firstWhereOrNull((entry) =>
      entry.association?.associationType == ModelAssociationType.belongsTo);
}

/// Gets the modelSchema from provider that matches the name and validates its fields.
StructureTypeDefinition getModelSchemaByModelName(
    String modelName, GraphQLRequestOperation? operation) {
  // ignore: invalid_use_of_protected_member
  final provider = Amplify.API.defaultPlugin.modelProvider;
  if (provider == null) {
    throw const ApiException(
      'No modelProvider found',
      recoverySuggestion:
          'Pass in a modelProvider instance while instantiating APIPlugin',
    );
  }
  final schema = <StructureTypeDefinition>[
    ...provider.modelSchemas,
    ...provider.customTypeSchemas,
  ].firstWhere((elem) => elem.name == modelName,
      orElse: () => throw ApiException(
            'No schema found for the ModelType provided: $modelName',
            recoverySuggestion: 'Pass in a valid modelProvider instance while '
                'instantiating APIPlugin or provide a valid ModelType',
          ));

  if (schema.fields.isEmpty) {
    throw const ApiException(
      'Schema found does not have a fields property',
      recoverySuggestion: 'Pass in a valid modelProvider instance while '
          'instantiating APIPlugin',
    );
  }

  return schema;
}

/// Transform the JSON from AppSync so it matches the fromJson in codegen models.
/// 1) Look for a parent in the schema. If that parent exists in the JSON, transform it.
/// 2) Look for list of children under [fieldName]["items"] and hoist up so no more ["items"].
Map<String, dynamic> transformAppSyncJsonToModelJson(
  Map<String, dynamic> input,
  StructureTypeDefinition modelSchema,
) {
  input = <String, dynamic>{...input}; // avoid mutating original

  // check for list at top-level and tranform each entry
  if (input[items] is List) {
    final transformedItems = (input[items] as List)
        .map((dynamic e) => e != null
            ? transformAppSyncJsonToModelJson(
                e as Map<String, dynamic>,
                modelSchema,
              )
            : null)
        .toList();
    input.update(items, (dynamic value) => transformedItems);
    return input;
  }

  final relatedFields = _getRelatedFields(modelSchema);

  // transform parents/hasOne recursively
  for (var parentField in relatedFields.singleFields) {
    final type = parentField.type.asLegacyType;
    final ofModelName = type.ofModelName ?? type.ofCustomTypeName;
    dynamic inputValue = input[parentField.name];
    if ((inputValue is Map || inputValue is List) && ofModelName != null) {
      final parentSchema = getModelSchemaByModelName(ofModelName, null);
      input.update(parentField.name, (dynamic parentData) {
        if (parentData is List) {
          // only used for embeddedCollection
          return parentData
              .map(
                (dynamic e) => {
                  _serializedData: transformAppSyncJsonToModelJson(
                    e as Map<String, dynamic>,
                    parentSchema,
                  )
                },
              )
              .toList();
        }
        return {
          _serializedData: transformAppSyncJsonToModelJson(
            parentData as Map<String, dynamic>,
            parentSchema,
          )
        };
      });
    }
  }

  // transform children recursively
  for (var childField in relatedFields.hasManyFields) {
    final type = childField.type.asLegacyType;
    final ofModelName = type.ofModelName;
    dynamic inputValue = input[childField.name];
    List<dynamic>? inputItems =
        (inputValue is Map) ? inputValue[items] as List? : null;
    if (inputItems is List && ofModelName != null) {
      final childSchema = getModelSchemaByModelName(ofModelName, null);
      final transformedItems = inputItems
          .map(
            (dynamic item) => {
              _serializedData: transformAppSyncJsonToModelJson(
                item as Map<String, dynamic>,
                childSchema,
              )
            },
          )
          .toList();
      input.update(childField.name, (dynamic value) => transformedItems);
    }
  }

  return input;
}
