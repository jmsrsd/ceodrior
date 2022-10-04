import 'package:drpc/drpc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read.project.router.output.freezed.dart';
part 'read.project.router.output.g.dart';

@freezed
class ReadProjectRouterOutput with _$ReadProjectRouterOutput {
  factory ReadProjectRouterOutput({
    required ProjectEntity project,
  }) = _ReadProjectRouterOutput;

  factory ReadProjectRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$ReadProjectRouterOutputFromJson(json);
}
