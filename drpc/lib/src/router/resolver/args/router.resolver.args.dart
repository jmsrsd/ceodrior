import 'package:freezed_annotation/freezed_annotation.dart';

part 'router.resolver.args.freezed.dart';
part 'router.resolver.args.g.dart';

@freezed
class RouterResolverArgs with _$RouterResolverArgs {
  factory RouterResolverArgs({
    required Map<String, dynamic> body,
    required Map<String, String> params,
    required Map<String, dynamic> errors,
  }) = _RouterResolverArgs;

  factory RouterResolverArgs.fromJson(Map<String, dynamic> json) =>
      _$RouterResolverArgsFromJson(json);
}
