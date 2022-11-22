// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_logging_dart.x_ray.model.resource_arn_detail;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResourceArnDetail extends ResourceArnDetail {
  @override
  final String? arn;

  factory _$ResourceArnDetail(
          [void Function(ResourceArnDetailBuilder)? updates]) =>
      (new ResourceArnDetailBuilder()..update(updates))._build();

  _$ResourceArnDetail._({this.arn}) : super._();

  @override
  ResourceArnDetail rebuild(void Function(ResourceArnDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceArnDetailBuilder toBuilder() =>
      new ResourceArnDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceArnDetail && arn == other.arn;
  }

  @override
  int get hashCode {
    return $jf($jc(0, arn.hashCode));
  }
}

class ResourceArnDetailBuilder
    implements Builder<ResourceArnDetail, ResourceArnDetailBuilder> {
  _$ResourceArnDetail? _$v;

  String? _arn;
  String? get arn => _$this._arn;
  set arn(String? arn) => _$this._arn = arn;

  ResourceArnDetailBuilder() {
    ResourceArnDetail._init(this);
  }

  ResourceArnDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _arn = $v.arn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceArnDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResourceArnDetail;
  }

  @override
  void update(void Function(ResourceArnDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResourceArnDetail build() => _build();

  _$ResourceArnDetail _build() {
    final _$result = _$v ?? new _$ResourceArnDetail._(arn: arn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
