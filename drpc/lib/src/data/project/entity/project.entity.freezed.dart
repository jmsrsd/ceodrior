// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectEntity _$ProjectEntityFromJson(Map<String, dynamic> json) {
  return _ProjectEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectEntityCopyWith<ProjectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEntityCopyWith<$Res> {
  factory $ProjectEntityCopyWith(
          ProjectEntity value, $Res Function(ProjectEntity) then) =
      _$ProjectEntityCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String author,
      String content,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._value, this._then);

  final ProjectEntity _value;
  // ignore: unused_field
  final $Res Function(ProjectEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? author = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectEntityCopyWith<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  factory _$$_ProjectEntityCopyWith(
          _$_ProjectEntity value, $Res Function(_$_ProjectEntity) then) =
      __$$_ProjectEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String author,
      String content,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_ProjectEntityCopyWithImpl<$Res>
    extends _$ProjectEntityCopyWithImpl<$Res>
    implements _$$_ProjectEntityCopyWith<$Res> {
  __$$_ProjectEntityCopyWithImpl(
      _$_ProjectEntity _value, $Res Function(_$_ProjectEntity) _then)
      : super(_value, (v) => _then(v as _$_ProjectEntity));

  @override
  _$_ProjectEntity get _value => super._value as _$_ProjectEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? author = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ProjectEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectEntity implements _ProjectEntity {
  _$_ProjectEntity(
      {required this.id,
      required this.title,
      required this.author,
      required this.content,
      required this.createdAt,
      required this.updatedAt});

  factory _$_ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectEntityFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String author;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProjectEntity(id: $id, title: $title, author: $author, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectEntityCopyWith<_$_ProjectEntity> get copyWith =>
      __$$_ProjectEntityCopyWithImpl<_$_ProjectEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectEntityToJson(
      this,
    );
  }
}

abstract class _ProjectEntity implements ProjectEntity {
  factory _ProjectEntity(
      {required final String id,
      required final String title,
      required final String author,
      required final String content,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_ProjectEntity;

  factory _ProjectEntity.fromJson(Map<String, dynamic> json) =
      _$_ProjectEntity.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get author;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectEntityCopyWith<_$_ProjectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
