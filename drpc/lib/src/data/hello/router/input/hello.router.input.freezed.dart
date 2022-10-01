// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hello.router.input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HelloRouterInput _$HelloRouterInputFromJson(Map<String, dynamic> json) {
  return _HelloRouterInput.fromJson(json);
}

/// @nodoc
mixin _$HelloRouterInput {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelloRouterInputCopyWith<HelloRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelloRouterInputCopyWith<$Res> {
  factory $HelloRouterInputCopyWith(
          HelloRouterInput value, $Res Function(HelloRouterInput) then) =
      _$HelloRouterInputCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$HelloRouterInputCopyWithImpl<$Res>
    implements $HelloRouterInputCopyWith<$Res> {
  _$HelloRouterInputCopyWithImpl(this._value, this._then);

  final HelloRouterInput _value;
  // ignore: unused_field
  final $Res Function(HelloRouterInput) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HelloRouterInputCopyWith<$Res>
    implements $HelloRouterInputCopyWith<$Res> {
  factory _$$_HelloRouterInputCopyWith(
          _$_HelloRouterInput value, $Res Function(_$_HelloRouterInput) then) =
      __$$_HelloRouterInputCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_HelloRouterInputCopyWithImpl<$Res>
    extends _$HelloRouterInputCopyWithImpl<$Res>
    implements _$$_HelloRouterInputCopyWith<$Res> {
  __$$_HelloRouterInputCopyWithImpl(
      _$_HelloRouterInput _value, $Res Function(_$_HelloRouterInput) _then)
      : super(_value, (v) => _then(v as _$_HelloRouterInput));

  @override
  _$_HelloRouterInput get _value => super._value as _$_HelloRouterInput;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_HelloRouterInput(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HelloRouterInput implements _HelloRouterInput {
  _$_HelloRouterInput({required this.name});

  factory _$_HelloRouterInput.fromJson(Map<String, dynamic> json) =>
      _$$_HelloRouterInputFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'HelloRouterInput(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HelloRouterInput &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_HelloRouterInputCopyWith<_$_HelloRouterInput> get copyWith =>
      __$$_HelloRouterInputCopyWithImpl<_$_HelloRouterInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HelloRouterInputToJson(
      this,
    );
  }
}

abstract class _HelloRouterInput implements HelloRouterInput {
  factory _HelloRouterInput({required final String name}) = _$_HelloRouterInput;

  factory _HelloRouterInput.fromJson(Map<String, dynamic> json) =
      _$_HelloRouterInput.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_HelloRouterInputCopyWith<_$_HelloRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}
