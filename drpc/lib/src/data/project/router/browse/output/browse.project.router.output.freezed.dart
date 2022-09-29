// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'browse.project.router.output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BrowseProjectRouterOutput _$BrowseProjectRouterOutputFromJson(
    Map<String, dynamic> json) {
  return _BrowseProjectRouterOutput.fromJson(json);
}

/// @nodoc
mixin _$BrowseProjectRouterOutput {
  List<ProjectEntity> get projects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrowseProjectRouterOutputCopyWith<BrowseProjectRouterOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowseProjectRouterOutputCopyWith<$Res> {
  factory $BrowseProjectRouterOutputCopyWith(BrowseProjectRouterOutput value,
          $Res Function(BrowseProjectRouterOutput) then) =
      _$BrowseProjectRouterOutputCopyWithImpl<$Res>;
  $Res call({List<ProjectEntity> projects});
}

/// @nodoc
class _$BrowseProjectRouterOutputCopyWithImpl<$Res>
    implements $BrowseProjectRouterOutputCopyWith<$Res> {
  _$BrowseProjectRouterOutputCopyWithImpl(this._value, this._then);

  final BrowseProjectRouterOutput _value;
  // ignore: unused_field
  final $Res Function(BrowseProjectRouterOutput) _then;

  @override
  $Res call({
    Object? projects = freezed,
  }) {
    return _then(_value.copyWith(
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectEntity>,
    ));
  }
}

/// @nodoc
abstract class _$$_BrowseProjectRouterOutputCopyWith<$Res>
    implements $BrowseProjectRouterOutputCopyWith<$Res> {
  factory _$$_BrowseProjectRouterOutputCopyWith(
          _$_BrowseProjectRouterOutput value,
          $Res Function(_$_BrowseProjectRouterOutput) then) =
      __$$_BrowseProjectRouterOutputCopyWithImpl<$Res>;
  @override
  $Res call({List<ProjectEntity> projects});
}

/// @nodoc
class __$$_BrowseProjectRouterOutputCopyWithImpl<$Res>
    extends _$BrowseProjectRouterOutputCopyWithImpl<$Res>
    implements _$$_BrowseProjectRouterOutputCopyWith<$Res> {
  __$$_BrowseProjectRouterOutputCopyWithImpl(
      _$_BrowseProjectRouterOutput _value,
      $Res Function(_$_BrowseProjectRouterOutput) _then)
      : super(_value, (v) => _then(v as _$_BrowseProjectRouterOutput));

  @override
  _$_BrowseProjectRouterOutput get _value =>
      super._value as _$_BrowseProjectRouterOutput;

  @override
  $Res call({
    Object? projects = freezed,
  }) {
    return _then(_$_BrowseProjectRouterOutput(
      projects: projects == freezed
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BrowseProjectRouterOutput implements _BrowseProjectRouterOutput {
  _$_BrowseProjectRouterOutput({required final List<ProjectEntity> projects})
      : _projects = projects;

  factory _$_BrowseProjectRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$$_BrowseProjectRouterOutputFromJson(json);

  final List<ProjectEntity> _projects;
  @override
  List<ProjectEntity> get projects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  String toString() {
    return 'BrowseProjectRouterOutput(projects: $projects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrowseProjectRouterOutput &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  _$$_BrowseProjectRouterOutputCopyWith<_$_BrowseProjectRouterOutput>
      get copyWith => __$$_BrowseProjectRouterOutputCopyWithImpl<
          _$_BrowseProjectRouterOutput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrowseProjectRouterOutputToJson(
      this,
    );
  }
}

abstract class _BrowseProjectRouterOutput implements BrowseProjectRouterOutput {
  factory _BrowseProjectRouterOutput(
          {required final List<ProjectEntity> projects}) =
      _$_BrowseProjectRouterOutput;

  factory _BrowseProjectRouterOutput.fromJson(Map<String, dynamic> json) =
      _$_BrowseProjectRouterOutput.fromJson;

  @override
  List<ProjectEntity> get projects;
  @override
  @JsonKey(ignore: true)
  _$$_BrowseProjectRouterOutputCopyWith<_$_BrowseProjectRouterOutput>
      get copyWith => throw _privateConstructorUsedError;
}
