// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_logging_dart.x_ray.model.fault_statistics;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FaultStatistics extends FaultStatistics {
  @override
  final _i2.Int64? otherCount;
  @override
  final _i2.Int64? totalCount;

  factory _$FaultStatistics([void Function(FaultStatisticsBuilder)? updates]) =>
      (new FaultStatisticsBuilder()..update(updates))._build();

  _$FaultStatistics._({this.otherCount, this.totalCount}) : super._();

  @override
  FaultStatistics rebuild(void Function(FaultStatisticsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaultStatisticsBuilder toBuilder() =>
      new FaultStatisticsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaultStatistics &&
        otherCount == other.otherCount &&
        totalCount == other.totalCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, otherCount.hashCode), totalCount.hashCode));
  }
}

class FaultStatisticsBuilder
    implements Builder<FaultStatistics, FaultStatisticsBuilder> {
  _$FaultStatistics? _$v;

  _i2.Int64? _otherCount;
  _i2.Int64? get otherCount => _$this._otherCount;
  set otherCount(_i2.Int64? otherCount) => _$this._otherCount = otherCount;

  _i2.Int64? _totalCount;
  _i2.Int64? get totalCount => _$this._totalCount;
  set totalCount(_i2.Int64? totalCount) => _$this._totalCount = totalCount;

  FaultStatisticsBuilder() {
    FaultStatistics._init(this);
  }

  FaultStatisticsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _otherCount = $v.otherCount;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaultStatistics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FaultStatistics;
  }

  @override
  void update(void Function(FaultStatisticsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FaultStatistics build() => _build();

  _$FaultStatistics _build() {
    final _$result = _$v ??
        new _$FaultStatistics._(otherCount: otherCount, totalCount: totalCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
