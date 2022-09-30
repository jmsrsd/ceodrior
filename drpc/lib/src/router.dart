import 'dart:convert';

import 'package:http/http.dart' as http;

import '../drpc.dart';

export 'data/data.dart';

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

  RouterResolverArgs copyWith({
    Map<String, dynamic>? body,
    Map<String, String>? params,
    Map<String, String>? slug,
    Map<String, dynamic>? errors,
  }) {
    return RouterResolverArgs(
      body: body ?? this.body,
      params: params ?? this.params,
      slug: slug ?? this.slug,
      errors: errors ?? this.errors,
    );
  }
}

typedef RouterResolver = Future<Map<String, dynamic> Function()> Function(
  RouterResolverArgs args,
);

class RouterFetchArgs {
  final Map<String, dynamic>? body;
  final Map<String, String>? params;
  final Map<String, String>? slug;
  final Map<String, dynamic>? errors;

  RouterFetchArgs({
    this.body,
    this.params,
    this.slug,
    this.errors,
  });

  RouterFetchArgs copyWith({
    Map<String, dynamic>? body,
    Map<String, String>? params,
    Map<String, String>? slug,
    Map<String, dynamic>? errors,
  }) {
    return RouterFetchArgs(
      body: body ?? this.body,
      params: params ?? this.params,
      slug: slug ?? this.slug,
      errors: errors ?? this.errors,
    );
  }
}

typedef RouterFetchHandler<TOutput> = Future<TOutput> Function([
  RouterFetchArgs? args,
]);

typedef RouterFetchFromJsonAsync<TOutput> = Future<TOutput> Function(
  Map<String, dynamic> json,
);

RouterFetchHandler<TOutput> createRouterFetchQuery<TOutput>({
  required String route,
  required RouterFetchFromJsonAsync<TOutput> fromJsonAsync,
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

    return await fromJsonAsync(
      jsonDecode(res.body),
    );
  };
}

RouterFetchHandler<TOutput> createRouterFetchMutation<TOutput>({
  required String route,
  required RouterFetchFromJsonAsync fromJsonAsync,
}) {
  return ([args]) async {
    final params = args?.params?.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');

    final res = await http.post(
      Uri.parse(
        '$host'
        '$route'
        '?${params ?? ''}',
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: args?.body ?? {},
    );

    return await fromJsonAsync(
      jsonDecode(res.body),
    );
  };
}

class Router<TQueryOutput, TMutationOutput> {
  final String route;
  final RouterResolver resolver;
  final RouterFetch<TQueryOutput, TMutationOutput> fetch;

  Router._({
    required this.route,
    required this.resolver,
    required this.fetch,
  });

  factory Router({
    required String route,
    required RouterResolver resolver,
    required RouterFetchFromJsonAsync<TQueryOutput> query,
    required RouterFetchFromJsonAsync<TMutationOutput> mutation,
  }) {
    return Router._(
      route: route,
      resolver: resolver,
      fetch: RouterFetch(
        route: route,
        query: query,
        mutation: mutation,
      ),
    );
  }
}

class RouterFetch<TQueryOutput, TMutationOutput> {
  late final RouterFetchHandler<TQueryOutput> query;
  late final RouterFetchHandler<TMutationOutput> mutation;

  RouterFetch({
    required String route,
    required RouterFetchFromJsonAsync<TQueryOutput> query,
    required RouterFetchFromJsonAsync<TMutationOutput> mutation,
  }) {
    this.query = createRouterFetchQuery<TQueryOutput>(
      route: route,
      fromJsonAsync: query,
    );
    this.mutation = createRouterFetchMutation(
      route: route,
      fromJsonAsync: mutation,
    );
  }
}
