// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_auth_cognito_dart.cognito_identity_provider.model.new_device_metadata_type;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewDeviceMetadataType extends NewDeviceMetadataType {
  @override
  final String? deviceGroupKey;
  @override
  final String? deviceKey;

  factory _$NewDeviceMetadataType(
          [void Function(NewDeviceMetadataTypeBuilder)? updates]) =>
      (new NewDeviceMetadataTypeBuilder()..update(updates))._build();

  _$NewDeviceMetadataType._({this.deviceGroupKey, this.deviceKey}) : super._();

  @override
  NewDeviceMetadataType rebuild(
          void Function(NewDeviceMetadataTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewDeviceMetadataTypeBuilder toBuilder() =>
      new NewDeviceMetadataTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewDeviceMetadataType &&
        deviceGroupKey == other.deviceGroupKey &&
        deviceKey == other.deviceKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceGroupKey.hashCode);
    _$hash = $jc(_$hash, deviceKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class NewDeviceMetadataTypeBuilder
    implements Builder<NewDeviceMetadataType, NewDeviceMetadataTypeBuilder> {
  _$NewDeviceMetadataType? _$v;

  String? _deviceGroupKey;
  String? get deviceGroupKey => _$this._deviceGroupKey;
  set deviceGroupKey(String? deviceGroupKey) =>
      _$this._deviceGroupKey = deviceGroupKey;

  String? _deviceKey;
  String? get deviceKey => _$this._deviceKey;
  set deviceKey(String? deviceKey) => _$this._deviceKey = deviceKey;

  NewDeviceMetadataTypeBuilder() {
    NewDeviceMetadataType._init(this);
  }

  NewDeviceMetadataTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceGroupKey = $v.deviceGroupKey;
      _deviceKey = $v.deviceKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewDeviceMetadataType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewDeviceMetadataType;
  }

  @override
  void update(void Function(NewDeviceMetadataTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewDeviceMetadataType build() => _build();

  _$NewDeviceMetadataType _build() {
    final _$result = _$v ??
        new _$NewDeviceMetadataType._(
            deviceGroupKey: deviceGroupKey, deviceKey: deviceKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
