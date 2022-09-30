// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delete.project.router.output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteProjectRouterOutput _$DeleteProjectRouterOutputFromJson(
    Map<String, dynamic> json) {
  return _DeleteProjectRouterOutput.fromJson(json);
}

/// @nodoc
mixin _$DeleteProjectRouterOutput {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteProjectRouterOutputCopyWith<DeleteProjectRouterOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteProjectRouterOutputCopyWith<$Res> {
  factory $DeleteProjectRouterOutputCopyWith(DeleteProjectRouterOutput value,
          $Res Function(DeleteProjectRouterOutput) then) =
      _$DeleteProjectRouterOutputCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$DeleteProjectRouterOutputCopyWithImpl<$Res>
    implements $DeleteProjectRouterOutputCopyWith<$Res> {
  _$DeleteProjectRouterOutputCopyWithImpl(this._value, this._then);

  final DeleteProjectRouterOutput _value;
  // ignore: unused_field
  final $Res Function(DeleteProjectRouterOutput) _then;

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
abstract class _$$_DeleteProjectRouterOutputCopyWith<$Res>
    implements $DeleteProjectRouterOutputCopyWith<$Res> {
  factory _$$_DeleteProjectRouterOutputCopyWith(
          _$_DeleteProjectRouterOutput value,
          $Res Function(_$_DeleteProjectRouterOutput) then) =
      __$$_DeleteProjectRouterOutputCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteProjectRouterOutputCopyWithImpl<$Res>
    extends _$DeleteProjectRouterOutputCopyWithImpl<$Res>
    implements _$$_DeleteProjectRouterOutputCopyWith<$Res> {
  __$$_DeleteProjectRouterOutputCopyWithImpl(
      _$_DeleteProjectRouterOutput _value,
      $Res Function(_$_DeleteProjectRouterOutput) _then)
      : super(_value, (v) => _then(v as _$_DeleteProjectRouterOutput));

  @override
  _$_DeleteProjectRouterOutput get _value =>
      super._value as _$_DeleteProjectRouterOutput;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DeleteProjectRouterOutput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeleteProjectRouterOutput implements _DeleteProjectRouterOutput {
  _$_DeleteProjectRouterOutput({required this.id});

  factory _$_DeleteProjectRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteProjectRouterOutputFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'DeleteProjectRouterOutput(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteProjectRouterOutput &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteProjectRouterOutputCopyWith<_$_DeleteProjectRouterOutput>
      get copyWith => __$$_DeleteProjectRouterOutputCopyWithImpl<
          _$_DeleteProjectRouterOutput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteProjectRouterOutputToJson(
      this,
    );
  }
}

abstract class _DeleteProjectRouterOutput implements DeleteProjectRouterOutput {
  factory _DeleteProjectRouterOutput({required final String id}) =
      _$_DeleteProjectRouterOutput;

  factory _DeleteProjectRouterOutput.fromJson(Map<String, dynamic> json) =
      _$_DeleteProjectRouterOutput.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteProjectRouterOutputCopyWith<_$_DeleteProjectRouterOutput>
      get copyWith => throw _privateConstructorUsedError;
}
