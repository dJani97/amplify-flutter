// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.dynamo_db.model.query_output;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QueryOutput extends QueryOutput {
  @override
  final _i2.ConsumedCapacity? consumedCapacity;
  @override
  final int? count;
  @override
  final _i4.BuiltList<_i4.BuiltMap<String, _i3.AttributeValue>>? items;
  @override
  final _i4.BuiltMap<String, _i3.AttributeValue>? lastEvaluatedKey;
  @override
  final int? scannedCount;

  factory _$QueryOutput([void Function(QueryOutputBuilder)? updates]) =>
      (new QueryOutputBuilder()..update(updates))._build();

  _$QueryOutput._(
      {this.consumedCapacity,
      this.count,
      this.items,
      this.lastEvaluatedKey,
      this.scannedCount})
      : super._();

  @override
  QueryOutput rebuild(void Function(QueryOutputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QueryOutputBuilder toBuilder() => new QueryOutputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QueryOutput &&
        consumedCapacity == other.consumedCapacity &&
        count == other.count &&
        items == other.items &&
        lastEvaluatedKey == other.lastEvaluatedKey &&
        scannedCount == other.scannedCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, consumedCapacity.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, lastEvaluatedKey.hashCode);
    _$hash = $jc(_$hash, scannedCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class QueryOutputBuilder implements Builder<QueryOutput, QueryOutputBuilder> {
  _$QueryOutput? _$v;

  _i2.ConsumedCapacityBuilder? _consumedCapacity;
  _i2.ConsumedCapacityBuilder get consumedCapacity =>
      _$this._consumedCapacity ??= new _i2.ConsumedCapacityBuilder();
  set consumedCapacity(_i2.ConsumedCapacityBuilder? consumedCapacity) =>
      _$this._consumedCapacity = consumedCapacity;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  _i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>>? _items;
  _i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>> get items =>
      _$this._items ??=
          new _i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>>();
  set items(_i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>>? items) =>
      _$this._items = items;

  _i4.MapBuilder<String, _i3.AttributeValue>? _lastEvaluatedKey;
  _i4.MapBuilder<String, _i3.AttributeValue> get lastEvaluatedKey =>
      _$this._lastEvaluatedKey ??=
          new _i4.MapBuilder<String, _i3.AttributeValue>();
  set lastEvaluatedKey(
          _i4.MapBuilder<String, _i3.AttributeValue>? lastEvaluatedKey) =>
      _$this._lastEvaluatedKey = lastEvaluatedKey;

  int? _scannedCount;
  int? get scannedCount => _$this._scannedCount;
  set scannedCount(int? scannedCount) => _$this._scannedCount = scannedCount;

  QueryOutputBuilder() {
    QueryOutput._init(this);
  }

  QueryOutputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _consumedCapacity = $v.consumedCapacity?.toBuilder();
      _count = $v.count;
      _items = $v.items?.toBuilder();
      _lastEvaluatedKey = $v.lastEvaluatedKey?.toBuilder();
      _scannedCount = $v.scannedCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QueryOutput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QueryOutput;
  }

  @override
  void update(void Function(QueryOutputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QueryOutput build() => _build();

  _$QueryOutput _build() {
    _$QueryOutput _$result;
    try {
      _$result = _$v ??
          new _$QueryOutput._(
              consumedCapacity: _consumedCapacity?.build(),
              count: count,
              items: _items?.build(),
              lastEvaluatedKey: _lastEvaluatedKey?.build(),
              scannedCount: scannedCount);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'consumedCapacity';
        _consumedCapacity?.build();

        _$failedField = 'items';
        _items?.build();
        _$failedField = 'lastEvaluatedKey';
        _lastEvaluatedKey?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QueryOutput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
