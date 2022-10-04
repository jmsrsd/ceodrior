import 'dart:convert';

import 'package:drpc/drpc.dart' as drpc;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef RouterHandler = Future<Response> Function(Request req);

enum RouterType {
  query,
  mutation;

  Future<Map<String, dynamic>?> Function(Request req) get decodeRequest {
    switch (this) {
      case RouterType.query:
        return (req) async {
          try {
            final url = req.url.toString();
            final params = url.substring(url.indexOf('?') + 1);
            return Map.fromEntries(
              params.split('&').map((e) {
                return e.split('=');
              }).map((e) {
                return MapEntry(e[0], e[1]);
              }),
            );
          } catch (e) {
            return null;
          }
        };
      case RouterType.mutation:
        return (req) async {
          try {
            final body = await req.readAsString();
            return jsonDecode(body);
          } catch (e) {
            return null;
          }
        };
    }
  }
}

Response encodeResponse(Map<String, dynamic>? response) {
  return Response.ok(
    jsonEncode(response ?? {}),
    headers: {'Content-Type': 'application/json'},
  );
}

class RouterConfig<TInput, TOutput> {
  final drpc.Router<TInput?, TOutput?> router;
  final RouterType type;
  final Future<TOutput?> Function(TInput? input) resolver;

  RouterConfig({
    required this.router,
    required this.type,
    required this.resolver,
  });

  void configure(Router shelfRouter) {
    final route = router.route;
    final handler = createRouterHandler<TInput, TOutput>(config: this);
    switch (type) {
      case RouterType.query:
        return shelfRouter.get(route, handler);
      case RouterType.mutation:
        return shelfRouter.post(route, handler);
    }
  }
}

RouterHandler createRouterHandler<TInput, TOutput>({
  required RouterConfig<TInput, TOutput> config,
}) {
  return (req) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final request = await config.type.decodeRequest(req);
      final input = config.router.inputIO.decode(request);
      final output = await config.resolver(input);
      final response = config.router.outputIO.encode(output);
      return encodeResponse(response);
    } catch (e) {
      return encodeResponse(null);
    }
  };
}
