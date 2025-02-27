// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.s3.model.metrics;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Metrics extends Metrics {
  @override
  final _i2.ReplicationTimeValue? eventThreshold;
  @override
  final _i3.MetricsStatus status;

  factory _$Metrics([void Function(MetricsBuilder)? updates]) =>
      (new MetricsBuilder()..update(updates))._build();

  _$Metrics._({this.eventThreshold, required this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'Metrics', 'status');
  }

  @override
  Metrics rebuild(void Function(MetricsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetricsBuilder toBuilder() => new MetricsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Metrics &&
        eventThreshold == other.eventThreshold &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, eventThreshold.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class MetricsBuilder implements Builder<Metrics, MetricsBuilder> {
  _$Metrics? _$v;

  _i2.ReplicationTimeValueBuilder? _eventThreshold;
  _i2.ReplicationTimeValueBuilder get eventThreshold =>
      _$this._eventThreshold ??= new _i2.ReplicationTimeValueBuilder();
  set eventThreshold(_i2.ReplicationTimeValueBuilder? eventThreshold) =>
      _$this._eventThreshold = eventThreshold;

  _i3.MetricsStatus? _status;
  _i3.MetricsStatus? get status => _$this._status;
  set status(_i3.MetricsStatus? status) => _$this._status = status;

  MetricsBuilder() {
    Metrics._init(this);
  }

  MetricsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventThreshold = $v.eventThreshold?.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Metrics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Metrics;
  }

  @override
  void update(void Function(MetricsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Metrics build() => _build();

  _$Metrics _build() {
    _$Metrics _$result;
    try {
      _$result = _$v ??
          new _$Metrics._(
              eventThreshold: _eventThreshold?.build(),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'Metrics', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'eventThreshold';
        _eventThreshold?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Metrics', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
