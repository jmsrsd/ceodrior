// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'read.project.router.input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadProjectRouterInput _$ReadProjectRouterInputFromJson(
    Map<String, dynamic> json) {
  return _ReadProjectRouterInput.fromJson(json);
}

/// @nodoc
mixin _$ReadProjectRouterInput {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadProjectRouterInputCopyWith<ReadProjectRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadProjectRouterInputCopyWith<$Res> {
  factory $ReadProjectRouterInputCopyWith(ReadProjectRouterInput value,
          $Res Function(ReadProjectRouterInput) then) =
      _$ReadProjectRouterInputCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$ReadProjectRouterInputCopyWithImpl<$Res>
    implements $ReadProjectRouterInputCopyWith<$Res> {
  _$ReadProjectRouterInputCopyWithImpl(this._value, this._then);

  final ReadProjectRouterInput _value;
  // ignore: unused_field
  final $Res Function(ReadProjectRouterInput) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReadProjectRouterInputCopyWith<$Res>
    implements $ReadProjectRouterInputCopyWith<$Res> {
  factory _$$_ReadProjectRouterInputCopyWith(_$_ReadProjectRouterInput value,
          $Res Function(_$_ReadProjectRouterInput) then) =
      __$$_ReadProjectRouterInputCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$$_ReadProjectRouterInputCopyWithImpl<$Res>
    extends _$ReadProjectRouterInputCopyWithImpl<$Res>
    implements _$$_ReadProjectRouterInputCopyWith<$Res> {
  __$$_ReadProjectRouterInputCopyWithImpl(_$_ReadProjectRouterInput _value,
      $Res Function(_$_ReadProjectRouterInput) _then)
      : super(_value, (v) => _then(v as _$_ReadProjectRouterInput));

  @override
  _$_ReadProjectRouterInput get _value =>
      super._value as _$_ReadProjectRouterInput;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_ReadProjectRouterInput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadProjectRouterInput implements _ReadProjectRouterInput {
  _$_ReadProjectRouterInput({required this.id});

  factory _$_ReadProjectRouterInput.fromJson(Map<String, dynamic> json) =>
      _$$_ReadProjectRouterInputFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'ReadProjectRouterInput(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadProjectRouterInput &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_ReadProjectRouterInputCopyWith<_$_ReadProjectRouterInput> get copyWith =>
      __$$_ReadProjectRouterInputCopyWithImpl<_$_ReadProjectRouterInput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadProjectRouterInputToJson(
      this,
    );
  }
}

abstract class _ReadProjectRouterInput implements ReadProjectRouterInput {
  factory _ReadProjectRouterInput({required final String id}) =
      _$_ReadProjectRouterInput;

  factory _ReadProjectRouterInput.fromJson(Map<String, dynamic> json) =
      _$_ReadProjectRouterInput.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_ReadProjectRouterInputCopyWith<_$_ReadProjectRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}
