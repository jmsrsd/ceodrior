import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../drpc.dart';

export 'hello/hello.router.dart';

class RouterResolverArgs {
  final Map<String, dynamic> body;
  final Map<String, String> params;
  final Map<String, String> slug;
  final Map<String, dynamic> errors;

  const RouterResolverArgs({
    required this.body,
    required this.params,
    required this.slug,
    required this.errors,
  });
}

typedef RouterResolver<TOutput> = Future<TOutput> Function(
  RouterResolverArgs args,
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

typedef RouterRequest<TOutput> = Future<TOutput> Function(
  RouterRequestArgs args,
);

class Router<TOutput> {
  final String route;
  final RouterQuery<TOutput> query;

  Router({
    required this.route,
    required this.query,
  });
}

class RouterQuery<TOutput> {
  final RouterResolver<TOutput> resolver;
  final RouterRequest<TOutput> request;

  RouterQuery({
    required this.resolver,
    required this.request,
  });
}

RouterRequest<TOutput> createQueryRequest<TOutput>(
  String route,
  TOutput Function(Map<String, dynamic> json) fromJson,
) {
  return (args) async {
    final params = args.params?.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');

    final res = await http.get(
      Uri.parse(
        '$host'
        '$route'
        '?${params ?? ''}',
      ),
    );

    return fromJson(
      jsonDecode(res.body),
    );
  };
}
