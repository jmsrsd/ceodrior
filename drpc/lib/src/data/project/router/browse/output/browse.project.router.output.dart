import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entity/project.entity.dart';

part 'browse.project.router.output.freezed.dart';
part 'browse.project.router.output.g.dart';

@freezed
class BrowseProjectRouterOutput with _$BrowseProjectRouterOutput {
  factory BrowseProjectRouterOutput({
    required List<ProjectEntity> projects,
  }) = _BrowseProjectRouterOutput;

  factory BrowseProjectRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$BrowseProjectRouterOutputFromJson(json);
}
