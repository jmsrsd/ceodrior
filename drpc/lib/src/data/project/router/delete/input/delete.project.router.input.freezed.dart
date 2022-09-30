// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delete.project.router.input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteProjectRouterInput _$DeleteProjectRouterInputFromJson(
    Map<String, dynamic> json) {
  return _DeleteProjectRouterInput.fromJson(json);
}

/// @nodoc
mixin _$DeleteProjectRouterInput {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteProjectRouterInputCopyWith<DeleteProjectRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteProjectRouterInputCopyWith<$Res> {
  factory $DeleteProjectRouterInputCopyWith(DeleteProjectRouterInput value,
          $Res Function(DeleteProjectRouterInput) then) =
      _$DeleteProjectRouterInputCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$DeleteProjectRouterInputCopyWithImpl<$Res>
    implements $DeleteProjectRouterInputCopyWith<$Res> {
  _$DeleteProjectRouterInputCopyWithImpl(this._value, this._then);

  final DeleteProjectRouterInput _value;
  // ignore: unused_field
  final $Res Function(DeleteProjectRouterInput) _then;

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
abstract class _$$_DeleteProjectRouterInputCopyWith<$Res>
    implements $DeleteProjectRouterInputCopyWith<$Res> {
  factory _$$_DeleteProjectRouterInputCopyWith(
          _$_DeleteProjectRouterInput value,
          $Res Function(_$_DeleteProjectRouterInput) then) =
      __$$_DeleteProjectRouterInputCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteProjectRouterInputCopyWithImpl<$Res>
    extends _$DeleteProjectRouterInputCopyWithImpl<$Res>
    implements _$$_DeleteProjectRouterInputCopyWith<$Res> {
  __$$_DeleteProjectRouterInputCopyWithImpl(_$_DeleteProjectRouterInput _value,
      $Res Function(_$_DeleteProjectRouterInput) _then)
      : super(_value, (v) => _then(v as _$_DeleteProjectRouterInput));

  @override
  _$_DeleteProjectRouterInput get _value =>
      super._value as _$_DeleteProjectRouterInput;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DeleteProjectRouterInput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeleteProjectRouterInput implements _DeleteProjectRouterInput {
  _$_DeleteProjectRouterInput({required this.id});

  factory _$_DeleteProjectRouterInput.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteProjectRouterInputFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'DeleteProjectRouterInput(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteProjectRouterInput &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteProjectRouterInputCopyWith<_$_DeleteProjectRouterInput>
      get copyWith => __$$_DeleteProjectRouterInputCopyWithImpl<
          _$_DeleteProjectRouterInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteProjectRouterInputToJson(
      this,
    );
  }
}

abstract class _DeleteProjectRouterInput implements DeleteProjectRouterInput {
  factory _DeleteProjectRouterInput({required final String id}) =
      _$_DeleteProjectRouterInput;

  factory _DeleteProjectRouterInput.fromJson(Map<String, dynamic> json) =
      _$_DeleteProjectRouterInput.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteProjectRouterInputCopyWith<_$_DeleteProjectRouterInput>
      get copyWith => throw _privateConstructorUsedError;
}
