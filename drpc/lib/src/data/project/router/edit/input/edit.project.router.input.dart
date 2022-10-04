import 'package:drpc/drpc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit.project.router.input.freezed.dart';
part 'edit.project.router.input.g.dart';

@freezed
class EditProjectRouterInput with _$EditProjectRouterInput {
  factory EditProjectRouterInput({
    required ProjectEntity project,
  }) = _EditProjectRouterInput;

  factory EditProjectRouterInput.fromJson(Map<String, dynamic> json) =>
      _$EditProjectRouterInputFromJson(json);
}
