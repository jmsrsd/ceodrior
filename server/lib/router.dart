import 'dart:convert';

import 'package:drpc/drpc.dart' as drpc;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef RouterHandler = Future<Response> Function(Request req);

RouterHandler createRouterHandler<TOutput>(
  drpc.RouterResolver<TOutput> resolver,
) {
  return (req) async {
    final errors = <String, dynamic>{};
    final encodedBody = await req.readAsString();
    final res = await resolver(
      drpc.RouterResolverArgs(
        body: _createRouterResolverBody(encodedBody, errors),
        params: _createRouterResolverParams(req, errors),
        slug: req.params,
        errors: errors,
      ),
    ) as dynamic;

    return Response.ok(
      jsonEncode(
        res.toJson(),
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  };
}

Map<String, dynamic> _createRouterResolverBody(
  String encodedBody,
  Map<String, dynamic> errors,
) {
  Map<String, dynamic>? body;
  try {
    body = jsonDecode(encodedBody);
  } catch (e) {
    errors['body'] = e;
    body = null;
  }
  return body ?? {};
}

Map<String, String> _createRouterResolverParams(
  Request req,
  Map<String, dynamic> errors,
) {
  Map<String, String>? params;
  try {
    final url = req.url.toString();
    final encodedParams = url.substring(url.indexOf('?') + 1);
    params = Map.fromEntries(
      encodedParams.split('&').map((e) {
        return e.split('=');
      }).map((e) {
        return MapEntry(e[0], e[1]);
      }),
    );
  } catch (e) {
    errors['params'] = e;
    params = null;
  }
  return params ?? {};
}
