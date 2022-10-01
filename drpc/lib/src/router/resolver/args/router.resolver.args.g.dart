// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.resolver.args.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouterResolverArgs _$$_RouterResolverArgsFromJson(
        Map<String, dynamic> json) =>
    _$_RouterResolverArgs(
      body: json['body'] as Map<String, dynamic>,
      params: Map<String, String>.from(json['params'] as Map),
      errors: json['errors'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_RouterResolverArgsToJson(
        _$_RouterResolverArgs instance) =>
    <String, dynamic>{
      'body': instance.body,
      'params': instance.params,
      'errors': instance.errors,
    };
