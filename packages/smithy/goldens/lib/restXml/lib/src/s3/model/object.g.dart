// GENERATED CODE - DO NOT MODIFY BY HAND

part of rest_xml_v1.s3.model.object;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$S3Object extends S3Object {
  @override
  final String? eTag;
  @override
  final String? key;
  @override
  final DateTime? lastModified;
  @override
  final _i2.Owner? owner;
  @override
  final int? size;
  @override
  final _i3.ObjectStorageClass? storageClass;

  factory _$S3Object([void Function(S3ObjectBuilder)? updates]) =>
      (new S3ObjectBuilder()..update(updates))._build();

  _$S3Object._(
      {this.eTag,
      this.key,
      this.lastModified,
      this.owner,
      this.size,
      this.storageClass})
      : super._();

  @override
  S3Object rebuild(void Function(S3ObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  S3ObjectBuilder toBuilder() => new S3ObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is S3Object &&
        eTag == other.eTag &&
        key == other.key &&
        lastModified == other.lastModified &&
        owner == other.owner &&
        size == other.size &&
        storageClass == other.storageClass;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, eTag.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, storageClass.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class S3ObjectBuilder implements Builder<S3Object, S3ObjectBuilder> {
  _$S3Object? _$v;

  String? _eTag;
  String? get eTag => _$this._eTag;
  set eTag(String? eTag) => _$this._eTag = eTag;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  DateTime? _lastModified;
  DateTime? get lastModified => _$this._lastModified;
  set lastModified(DateTime? lastModified) =>
      _$this._lastModified = lastModified;

  _i2.OwnerBuilder? _owner;
  _i2.OwnerBuilder get owner => _$this._owner ??= new _i2.OwnerBuilder();
  set owner(_i2.OwnerBuilder? owner) => _$this._owner = owner;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  _i3.ObjectStorageClass? _storageClass;
  _i3.ObjectStorageClass? get storageClass => _$this._storageClass;
  set storageClass(_i3.ObjectStorageClass? storageClass) =>
      _$this._storageClass = storageClass;

  S3ObjectBuilder() {
    S3Object._init(this);
  }

  S3ObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eTag = $v.eTag;
      _key = $v.key;
      _lastModified = $v.lastModified;
      _owner = $v.owner?.toBuilder();
      _size = $v.size;
      _storageClass = $v.storageClass;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(S3Object other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$S3Object;
  }

  @override
  void update(void Function(S3ObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  S3Object build() => _build();

  _$S3Object _build() {
    _$S3Object _$result;
    try {
      _$result = _$v ??
          new _$S3Object._(
              eTag: eTag,
              key: key,
              lastModified: lastModified,
              owner: _owner?.build(),
              size: size,
              storageClass: storageClass);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'owner';
        _owner?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'S3Object', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
