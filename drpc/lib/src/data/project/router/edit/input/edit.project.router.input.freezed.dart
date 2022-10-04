// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit.project.router.input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditProjectRouterInput _$EditProjectRouterInputFromJson(
    Map<String, dynamic> json) {
  return _EditProjectRouterInput.fromJson(json);
}

/// @nodoc
mixin _$EditProjectRouterInput {
  ProjectEntity get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditProjectRouterInputCopyWith<EditProjectRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProjectRouterInputCopyWith<$Res> {
  factory $EditProjectRouterInputCopyWith(EditProjectRouterInput value,
          $Res Function(EditProjectRouterInput) then) =
      _$EditProjectRouterInputCopyWithImpl<$Res>;
  $Res call({ProjectEntity project});

  $ProjectEntityCopyWith<$Res> get project;
}

/// @nodoc
class _$EditProjectRouterInputCopyWithImpl<$Res>
    implements $EditProjectRouterInputCopyWith<$Res> {
  _$EditProjectRouterInputCopyWithImpl(this._value, this._then);

  final EditProjectRouterInput _value;
  // ignore: unused_field
  final $Res Function(EditProjectRouterInput) _then;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_value.copyWith(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectEntity,
    ));
  }

  @override
  $ProjectEntityCopyWith<$Res> get project {
    return $ProjectEntityCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditProjectRouterInputCopyWith<$Res>
    implements $EditProjectRouterInputCopyWith<$Res> {
  factory _$$_EditProjectRouterInputCopyWith(_$_EditProjectRouterInput value,
          $Res Function(_$_EditProjectRouterInput) then) =
      __$$_EditProjectRouterInputCopyWithImpl<$Res>;
  @override
  $Res call({ProjectEntity project});

  @override
  $ProjectEntityCopyWith<$Res> get project;
}

/// @nodoc
class __$$_EditProjectRouterInputCopyWithImpl<$Res>
    extends _$EditProjectRouterInputCopyWithImpl<$Res>
    implements _$$_EditProjectRouterInputCopyWith<$Res> {
  __$$_EditProjectRouterInputCopyWithImpl(_$_EditProjectRouterInput _value,
      $Res Function(_$_EditProjectRouterInput) _then)
      : super(_value, (v) => _then(v as _$_EditProjectRouterInput));

  @override
  _$_EditProjectRouterInput get _value =>
      super._value as _$_EditProjectRouterInput;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$_EditProjectRouterInput(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditProjectRouterInput implements _EditProjectRouterInput {
  _$_EditProjectRouterInput({required this.project});

  factory _$_EditProjectRouterInput.fromJson(Map<String, dynamic> json) =>
      _$$_EditProjectRouterInputFromJson(json);

  @override
  final ProjectEntity project;

  @override
  String toString() {
    return 'EditProjectRouterInput(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProjectRouterInput &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$_EditProjectRouterInputCopyWith<_$_EditProjectRouterInput> get copyWith =>
      __$$_EditProjectRouterInputCopyWithImpl<_$_EditProjectRouterInput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditProjectRouterInputToJson(
      this,
    );
  }
}

abstract class _EditProjectRouterInput implements EditProjectRouterInput {
  factory _EditProjectRouterInput({required final ProjectEntity project}) =
      _$_EditProjectRouterInput;

  factory _EditProjectRouterInput.fromJson(Map<String, dynamic> json) =
      _$_EditProjectRouterInput.fromJson;

  @override
  ProjectEntity get project;
  @override
  @JsonKey(ignore: true)
  _$$_EditProjectRouterInputCopyWith<_$_EditProjectRouterInput> get copyWith =>
      throw _privateConstructorUsedError;
}
