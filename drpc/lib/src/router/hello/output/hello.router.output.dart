import 'package:freezed_annotation/freezed_annotation.dart';

part 'hello.router.output.freezed.dart';
part 'hello.router.output.g.dart';

@freezed
class HelloRouterOutput with _$HelloRouterOutput {
  factory HelloRouterOutput({
    String? say,
    String? error,
  }) = _HelloRouterOutput;

  factory HelloRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$HelloRouterOutputFromJson(json);
}
