import 'package:freezed_annotation/freezed_annotation.dart';

part 'read.project.router.input.freezed.dart';
part 'read.project.router.input.g.dart';

@freezed
class ReadProjectRouterInput with _$ReadProjectRouterInput {
  factory ReadProjectRouterInput({
    required String id,
  }) = _ReadProjectRouterInput;

  factory ReadProjectRouterInput.fromJson(Map<String, dynamic> json) =>
      _$ReadProjectRouterInputFromJson(json);
}
