// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectEntity _$$_ProjectEntityFromJson(Map<String, dynamic> json) =>
    _$_ProjectEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ProjectEntityToJson(_$_ProjectEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
