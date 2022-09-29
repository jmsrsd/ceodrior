// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse.project.router.output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BrowseProjectRouterOutput _$$_BrowseProjectRouterOutputFromJson(
        Map<String, dynamic> json) =>
    _$_BrowseProjectRouterOutput(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BrowseProjectRouterOutputToJson(
        _$_BrowseProjectRouterOutput instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
