import 'dart:convert';

import 'package:drpc/drpc.dart' as drpc;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef RouterHandler = Future<Response> Function(Request req);

enum RouterType { query, mutation }

extension RequestExtension on Request {
  Future<Map<String, dynamic>?> payload(RouterType type) async {
    switch (type) {
      case RouterType.query:
        try {
          final url = this.url.toString();
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
      case RouterType.mutation:
        try {
          final body = await readAsString();
          return jsonDecode(body);
        } catch (e) {
          return null;
        }
    }
  }
}

extension JsonExtension on Map<String, dynamic> {
  Response response() {
    return Response.ok(
      jsonEncode(this),
      headers: {'Content-Type': 'application/json'},
    );
  }
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

  void configure(Router router) {
    final route = this.router.route;
    final handler = createRouterHandler<TInput, TOutput>(config: this);
    switch (type) {
      case RouterType.query:
        return router.get(route, handler);
      case RouterType.mutation:
        return router.post(route, handler);
    }
  }
}

RouterHandler createRouterHandler<TInput, TOutput>({
  required RouterConfig<TInput, TOutput> config,
}) {
  return (req) async {
    await drpc.waitFor(500);
    return await drpc.executeAsync<Map<String, dynamic>>(() async {
      try {
        final request = await req.payload(config.type);
        final input = config.router.inputIO.decode(request);
        final output = await config.resolver(input);
        return config.router.outputIO.encode(output) ?? {};
      } catch (e) {
        return {};
      }
    }).then((res) {
      return res.response();
    });
  };
}
