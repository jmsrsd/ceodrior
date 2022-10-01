// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'router.resolver.args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouterResolverArgs _$RouterResolverArgsFromJson(Map<String, dynamic> json) {
  return _RouterResolverArgs.fromJson(json);
}

/// @nodoc
mixin _$RouterResolverArgs {
  Map<String, dynamic> get body => throw _privateConstructorUsedError;
  Map<String, String> get params => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouterResolverArgsCopyWith<RouterResolverArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterResolverArgsCopyWith<$Res> {
  factory $RouterResolverArgsCopyWith(
          RouterResolverArgs value, $Res Function(RouterResolverArgs) then) =
      _$RouterResolverArgsCopyWithImpl<$Res>;
  $Res call(
      {Map<String, dynamic> body,
      Map<String, String> params,
      Map<String, dynamic> errors});
}

/// @nodoc
class _$RouterResolverArgsCopyWithImpl<$Res>
    implements $RouterResolverArgsCopyWith<$Res> {
  _$RouterResolverArgsCopyWithImpl(this._value, this._then);

  final RouterResolverArgs _value;
  // ignore: unused_field
  final $Res Function(RouterResolverArgs) _then;

  @override
  $Res call({
    Object? body = freezed,
    Object? params = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_RouterResolverArgsCopyWith<$Res>
    implements $RouterResolverArgsCopyWith<$Res> {
  factory _$$_RouterResolverArgsCopyWith(_$_RouterResolverArgs value,
          $Res Function(_$_RouterResolverArgs) then) =
      __$$_RouterResolverArgsCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, dynamic> body,
      Map<String, String> params,
      Map<String, dynamic> errors});
}

/// @nodoc
class __$$_RouterResolverArgsCopyWithImpl<$Res>
    extends _$RouterResolverArgsCopyWithImpl<$Res>
    implements _$$_RouterResolverArgsCopyWith<$Res> {
  __$$_RouterResolverArgsCopyWithImpl(
      _$_RouterResolverArgs _value, $Res Function(_$_RouterResolverArgs) _then)
      : super(_value, (v) => _then(v as _$_RouterResolverArgs));

  @override
  _$_RouterResolverArgs get _value => super._value as _$_RouterResolverArgs;

  @override
  $Res call({
    Object? body = freezed,
    Object? params = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_RouterResolverArgs(
      body: body == freezed
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      params: params == freezed
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      errors: errors == freezed
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouterResolverArgs implements _RouterResolverArgs {
  _$_RouterResolverArgs(
      {required final Map<String, dynamic> body,
      required final Map<String, String> params,
      required final Map<String, dynamic> errors})
      : _body = body,
        _params = params,
        _errors = errors;

  factory _$_RouterResolverArgs.fromJson(Map<String, dynamic> json) =>
      _$$_RouterResolverArgsFromJson(json);

  final Map<String, dynamic> _body;
  @override
  Map<String, dynamic> get body {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_body);
  }

  final Map<String, String> _params;
  @override
  Map<String, String> get params {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  final Map<String, dynamic> _errors;
  @override
  Map<String, dynamic> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'RouterResolverArgs(body: $body, params: $params, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouterResolverArgs &&
            const DeepCollectionEquality().equals(other._body, _body) &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_body),
      const DeepCollectionEquality().hash(_params),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  _$$_RouterResolverArgsCopyWith<_$_RouterResolverArgs> get copyWith =>
      __$$_RouterResolverArgsCopyWithImpl<_$_RouterResolverArgs>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouterResolverArgsToJson(
      this,
    );
  }
}

abstract class _RouterResolverArgs implements RouterResolverArgs {
  factory _RouterResolverArgs(
      {required final Map<String, dynamic> body,
      required final Map<String, String> params,
      required final Map<String, dynamic> errors}) = _$_RouterResolverArgs;

  factory _RouterResolverArgs.fromJson(Map<String, dynamic> json) =
      _$_RouterResolverArgs.fromJson;

  @override
  Map<String, dynamic> get body;
  @override
  Map<String, String> get params;
  @override
  Map<String, dynamic> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_RouterResolverArgsCopyWith<_$_RouterResolverArgs> get copyWith =>
      throw _privateConstructorUsedError;
}
