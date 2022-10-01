import 'package:freezed_annotation/freezed_annotation.dart';

part 'hello.router.input.freezed.dart';
part 'hello.router.input.g.dart';

@freezed
class HelloRouterInput with _$HelloRouterInput {
  factory HelloRouterInput({
    required String name,
  }) = _HelloRouterInput;

  factory HelloRouterInput.fromJson(Map<String, dynamic> json) =>
      _$HelloRouterInputFromJson(json);
}
