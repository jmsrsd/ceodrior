// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hello.router.output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HelloRouterOutput _$HelloRouterOutputFromJson(Map<String, dynamic> json) {
  return _HelloRouterOutput.fromJson(json);
}

/// @nodoc
mixin _$HelloRouterOutput {
  String? get say => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelloRouterOutputCopyWith<HelloRouterOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelloRouterOutputCopyWith<$Res> {
  factory $HelloRouterOutputCopyWith(
          HelloRouterOutput value, $Res Function(HelloRouterOutput) then) =
      _$HelloRouterOutputCopyWithImpl<$Res>;
  $Res call({String? say, String? error});
}

/// @nodoc
class _$HelloRouterOutputCopyWithImpl<$Res>
    implements $HelloRouterOutputCopyWith<$Res> {
  _$HelloRouterOutputCopyWithImpl(this._value, this._then);

  final HelloRouterOutput _value;
  // ignore: unused_field
  final $Res Function(HelloRouterOutput) _then;

  @override
  $Res call({
    Object? say = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      say: say == freezed
          ? _value.say
          : say // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HelloRouterOutputCopyWith<$Res>
    implements $HelloRouterOutputCopyWith<$Res> {
  factory _$$_HelloRouterOutputCopyWith(_$_HelloRouterOutput value,
          $Res Function(_$_HelloRouterOutput) then) =
      __$$_HelloRouterOutputCopyWithImpl<$Res>;
  @override
  $Res call({String? say, String? error});
}

/// @nodoc
class __$$_HelloRouterOutputCopyWithImpl<$Res>
    extends _$HelloRouterOutputCopyWithImpl<$Res>
    implements _$$_HelloRouterOutputCopyWith<$Res> {
  __$$_HelloRouterOutputCopyWithImpl(
      _$_HelloRouterOutput _value, $Res Function(_$_HelloRouterOutput) _then)
      : super(_value, (v) => _then(v as _$_HelloRouterOutput));

  @override
  _$_HelloRouterOutput get _value => super._value as _$_HelloRouterOutput;

  @override
  $Res call({
    Object? say = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_HelloRouterOutput(
      say: say == freezed
          ? _value.say
          : say // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HelloRouterOutput implements _HelloRouterOutput {
  _$_HelloRouterOutput({this.say, this.error});

  factory _$_HelloRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$$_HelloRouterOutputFromJson(json);

  @override
  final String? say;
  @override
  final String? error;

  @override
  String toString() {
    return 'HelloRouterOutput(say: $say, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HelloRouterOutput &&
            const DeepCollectionEquality().equals(other.say, say) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(say),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_HelloRouterOutputCopyWith<_$_HelloRouterOutput> get copyWith =>
      __$$_HelloRouterOutputCopyWithImpl<_$_HelloRouterOutput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HelloRouterOutputToJson(
      this,
    );
  }
}

abstract class _HelloRouterOutput implements HelloRouterOutput {
  factory _HelloRouterOutput({final String? say, final String? error}) =
      _$_HelloRouterOutput;

  factory _HelloRouterOutput.fromJson(Map<String, dynamic> json) =
      _$_HelloRouterOutput.fromJson;

  @override
  String? get say;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HelloRouterOutputCopyWith<_$_HelloRouterOutput> get copyWith =>
      throw _privateConstructorUsedError;
}
