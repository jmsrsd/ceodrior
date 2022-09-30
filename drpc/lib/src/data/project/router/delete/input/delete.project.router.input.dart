import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete.project.router.input.freezed.dart';
part 'delete.project.router.input.g.dart';

@freezed
class DeleteProjectRouterInput with _$DeleteProjectRouterInput {
  factory DeleteProjectRouterInput({
    required String id,
  }) = _DeleteProjectRouterInput;

  factory DeleteProjectRouterInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectRouterInputFromJson(json);
}
