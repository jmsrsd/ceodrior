import 'dart:convert';

import 'package:http/http.dart' as http;

import '../drpc.dart';

export 'data/data.dart';

class RouterHandlerArgs {
  final Map<String, dynamic> body;
  final Map<String, String> params;
  final Map<String, String> slug;
  final Map<String, dynamic> errors;

  const RouterHandlerArgs({
    required this.body,
    required this.params,
    required this.slug,
    required this.errors,
  });
}

typedef RouterHandler<TOutput> = Future<TOutput> Function(
  RouterHandlerArgs args,
);

class RouterRequestArgs {
  final Map<String, dynamic>? body;
  final Map<String, String>? params;
  final Map<String, String>? slug;
  final Map<String, dynamic>? errors;

  RouterRequestArgs({
    this.body,
    this.params,
    this.slug,
    this.errors,
  });
}

typedef RouterRequest<TOutput> = Future<TOutput> Function([
  RouterRequestArgs? args,
]);

class Router<TOutput> {
  final RouterHandler<TOutput> handler;
  final RouterRequest<TOutput> request;

  Router({
    required this.handler,
    required this.request,
  });
}

typedef RouterRequestOutputFromJsonAsync<TOutput> = Future<TOutput> Function(
  Map<String, dynamic> json,
);

RouterRequest<TOutput> createRouterRequest<TOutput>({
  required String route,
  required RouterRequestOutputFromJsonAsync<TOutput> outputFromJsonAsync,
}) {
  return ([args]) async {
    final params = args?.params?.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');

    final res = await http.get(
      Uri.parse(
        '$host'
        '$route'
        '?${params ?? ''}',
      ),
    );

    return await outputFromJsonAsync(
      jsonDecode(res.body),
    );
  };
}
