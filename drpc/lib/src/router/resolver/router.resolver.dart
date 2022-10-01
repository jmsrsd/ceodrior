import 'package:drpc/drpc.dart';

export 'args/router.resolver.args.dart';

typedef RouterResolver = Future<Map<String, dynamic> Function()> Function(
  RouterResolverArgs args,
);
