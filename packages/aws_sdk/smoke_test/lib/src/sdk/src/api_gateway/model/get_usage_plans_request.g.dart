// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.api_gateway.model.get_usage_plans_request;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUsagePlansRequest extends GetUsagePlansRequest {
  @override
  final String? keyId;
  @override
  final int? limit;
  @override
  final String? position;

  factory _$GetUsagePlansRequest(
          [void Function(GetUsagePlansRequestBuilder)? updates]) =>
      (new GetUsagePlansRequestBuilder()..update(updates))._build();

  _$GetUsagePlansRequest._({this.keyId, this.limit, this.position}) : super._();

  @override
  GetUsagePlansRequest rebuild(
          void Function(GetUsagePlansRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsagePlansRequestBuilder toBuilder() =>
      new GetUsagePlansRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsagePlansRequest &&
        keyId == other.keyId &&
        limit == other.limit &&
        position == other.position;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, keyId.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class GetUsagePlansRequestBuilder
    implements Builder<GetUsagePlansRequest, GetUsagePlansRequestBuilder> {
  _$GetUsagePlansRequest? _$v;

  String? _keyId;
  String? get keyId => _$this._keyId;
  set keyId(String? keyId) => _$this._keyId = keyId;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  GetUsagePlansRequestBuilder() {
    GetUsagePlansRequest._init(this);
  }

  GetUsagePlansRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keyId = $v.keyId;
      _limit = $v.limit;
      _position = $v.position;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUsagePlansRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsagePlansRequest;
  }

  @override
  void update(void Function(GetUsagePlansRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsagePlansRequest build() => _build();

  _$GetUsagePlansRequest _build() {
    final _$result = _$v ??
        new _$GetUsagePlansRequest._(
            keyId: keyId, limit: limit, position: position);
    replace(_$result);
    return _$result;
  }
}

class _$GetUsagePlansRequestPayload extends GetUsagePlansRequestPayload {
  factory _$GetUsagePlansRequestPayload(
          [void Function(GetUsagePlansRequestPayloadBuilder)? updates]) =>
      (new GetUsagePlansRequestPayloadBuilder()..update(updates))._build();

  _$GetUsagePlansRequestPayload._() : super._();

  @override
  GetUsagePlansRequestPayload rebuild(
          void Function(GetUsagePlansRequestPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsagePlansRequestPayloadBuilder toBuilder() =>
      new GetUsagePlansRequestPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsagePlansRequestPayload;
  }

  @override
  int get hashCode {
    return 480962090;
  }
}

class GetUsagePlansRequestPayloadBuilder
    implements
        Builder<GetUsagePlansRequestPayload,
            GetUsagePlansRequestPayloadBuilder> {
  _$GetUsagePlansRequestPayload? _$v;

  GetUsagePlansRequestPayloadBuilder() {
    GetUsagePlansRequestPayload._init(this);
  }

  @override
  void replace(GetUsagePlansRequestPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsagePlansRequestPayload;
  }

  @override
  void update(void Function(GetUsagePlansRequestPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsagePlansRequestPayload build() => _build();

  _$GetUsagePlansRequestPayload _build() {
    final _$result = _$v ?? new _$GetUsagePlansRequestPayload._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
