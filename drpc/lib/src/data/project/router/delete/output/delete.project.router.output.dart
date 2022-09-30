import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete.project.router.output.freezed.dart';
part 'delete.project.router.output.g.dart';

@freezed
class DeleteProjectRouterOutput with _$DeleteProjectRouterOutput {
  factory DeleteProjectRouterOutput({
    required String id,
  }) = _DeleteProjectRouterOutput;

  factory DeleteProjectRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectRouterOutputFromJson(json);
}
