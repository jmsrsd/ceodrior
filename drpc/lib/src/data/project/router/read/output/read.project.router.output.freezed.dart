// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'read.project.router.output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadProjectRouterOutput _$ReadProjectRouterOutputFromJson(
    Map<String, dynamic> json) {
  return _ReadProjectRouterOutput.fromJson(json);
}

/// @nodoc
mixin _$ReadProjectRouterOutput {
  ProjectEntity get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadProjectRouterOutputCopyWith<ReadProjectRouterOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadProjectRouterOutputCopyWith<$Res> {
  factory $ReadProjectRouterOutputCopyWith(ReadProjectRouterOutput value,
          $Res Function(ReadProjectRouterOutput) then) =
      _$ReadProjectRouterOutputCopyWithImpl<$Res>;
  $Res call({ProjectEntity project});

  $ProjectEntityCopyWith<$Res> get project;
}

/// @nodoc
class _$ReadProjectRouterOutputCopyWithImpl<$Res>
    implements $ReadProjectRouterOutputCopyWith<$Res> {
  _$ReadProjectRouterOutputCopyWithImpl(this._value, this._then);

  final ReadProjectRouterOutput _value;
  // ignore: unused_field
  final $Res Function(ReadProjectRouterOutput) _then;

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
abstract class _$$_ReadProjectRouterOutputCopyWith<$Res>
    implements $ReadProjectRouterOutputCopyWith<$Res> {
  factory _$$_ReadProjectRouterOutputCopyWith(_$_ReadProjectRouterOutput value,
          $Res Function(_$_ReadProjectRouterOutput) then) =
      __$$_ReadProjectRouterOutputCopyWithImpl<$Res>;
  @override
  $Res call({ProjectEntity project});

  @override
  $ProjectEntityCopyWith<$Res> get project;
}

/// @nodoc
class __$$_ReadProjectRouterOutputCopyWithImpl<$Res>
    extends _$ReadProjectRouterOutputCopyWithImpl<$Res>
    implements _$$_ReadProjectRouterOutputCopyWith<$Res> {
  __$$_ReadProjectRouterOutputCopyWithImpl(_$_ReadProjectRouterOutput _value,
      $Res Function(_$_ReadProjectRouterOutput) _then)
      : super(_value, (v) => _then(v as _$_ReadProjectRouterOutput));

  @override
  _$_ReadProjectRouterOutput get _value =>
      super._value as _$_ReadProjectRouterOutput;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$_ReadProjectRouterOutput(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadProjectRouterOutput implements _ReadProjectRouterOutput {
  _$_ReadProjectRouterOutput({required this.project});

  factory _$_ReadProjectRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$$_ReadProjectRouterOutputFromJson(json);

  @override
  final ProjectEntity project;

  @override
  String toString() {
    return 'ReadProjectRouterOutput(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadProjectRouterOutput &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$_ReadProjectRouterOutputCopyWith<_$_ReadProjectRouterOutput>
      get copyWith =>
          __$$_ReadProjectRouterOutputCopyWithImpl<_$_ReadProjectRouterOutput>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadProjectRouterOutputToJson(
      this,
    );
  }
}

abstract class _ReadProjectRouterOutput implements ReadProjectRouterOutput {
  factory _ReadProjectRouterOutput({required final ProjectEntity project}) =
      _$_ReadProjectRouterOutput;

  factory _ReadProjectRouterOutput.fromJson(Map<String, dynamic> json) =
      _$_ReadProjectRouterOutput.fromJson;

  @override
  ProjectEntity get project;
  @override
  @JsonKey(ignore: true)
  _$$_ReadProjectRouterOutputCopyWith<_$_ReadProjectRouterOutput>
      get copyWith => throw _privateConstructorUsedError;
}
