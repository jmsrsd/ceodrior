import 'dart:convert';

import 'package:drpc/drpc.dart' as drpc;
import 'package:shelf/shelf.dart';

typedef RouterHandler = Future<Response> Function(Request req);

enum RouterType {
  query,
  mutation;

  Future<Map<String, dynamic>?> Function(Request req) get createRequest {
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

Response createResponse(Map<String, dynamic>? res) {
  return Response.ok(
    jsonEncode(res ?? {}),
    headers: {'Content-Type': 'application/json'},
  );
}

RouterHandler createRouterHandler<TInput, TOutput>({
  required RouterType type,
  required drpc.Router<TInput?, TOutput?> router,
  required Future<TOutput?> Function(TInput? input) resolver,
}) {
  return (req) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final request = await type.createRequest(req);
      final input = router.inputIO.decode(request);
      final output = await resolver(input);
      final res = router.outputIO.encode(output);
      return createResponse(res);
    } catch (e) {
      return createResponse(null);
    }
  };
}
