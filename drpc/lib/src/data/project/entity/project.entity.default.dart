import 'project.entity.dart';

ProjectEntity defaultProjectEntity({
  required String id,
}) {
  return ProjectEntity(
    id: id,
    title: '',
    author: '',
    content: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
