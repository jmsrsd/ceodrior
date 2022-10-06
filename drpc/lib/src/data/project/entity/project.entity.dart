import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.entity.freezed.dart';
part 'project.entity.g.dart';

@freezed
class ProjectEntity with _$ProjectEntity {
  factory ProjectEntity({
    required String id,
    required String title,
    required String author,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);
}
