import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../drpc.dart';

export 'data/data.dart';

class RouterResolverArgs {
  final Map<String, dynamic> body;
  final Map<String, String> params;

  final Map<String, dynamic> errors;

  const RouterResolverArgs({
    required this.body,
    required this.params,
    required this.errors,
  });

  RouterResolverArgs copyWith({
    Map<String, dynamic>? body,
    Map<String, String>? params,
    Map<String, dynamic>? errors,
  }) {
    return RouterResolverArgs(
      body: body ?? this.body,
      params: params ?? this.params,
      errors: errors ?? this.errors,
    );
  }
}

typedef RouterResolver = Future<Map<String, dynamic> Function()> Function(
  RouterResolverArgs args,
);

class RouterFetchArgs {
  final FutureOr<Map<String, dynamic>> Function()? input;
  final Map<String, String>? params;

  RouterFetchArgs({
    this.input,
    this.params,
  });

  RouterFetchArgs copyWith({
    FutureOr<Map<String, dynamic>> Function()? input,
    Map<String, String>? params,
  }) {
    return RouterFetchArgs(
      input: input ?? this.input,
      params: params ?? this.params,
    );
  }
}

typedef RouterFetchHandler<TOutput> = Future<TOutput> Function([
  RouterFetchArgs? args,
]);

typedef RouterFetchOutputFromBodyAsync<TOutput> = Future<TOutput> Function(
  Map<String, dynamic> body,
);

RouterFetchHandler<TOutput> createRouterFetchQuery<TOutput>({
  required String route,
  required RouterFetchOutputFromBodyAsync<TOutput> outputFromBodyAsync,
}) {
  return ([args]) async {
    final params = args?.params?.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');

    final res = await http.get(
      Uri.parse(
        [
          '$host$route',
          params ?? '',
        ].where((e) => e.isNotEmpty).join('?'),
      ),
    );

    return await outputFromBodyAsync(
      jsonDecode(res.body),
    );
  };
}

RouterFetchHandler<TOutput> createRouterFetchMutation<TOutput>({
  required String route,
  required RouterFetchOutputFromBodyAsync outputFromBodyAsync,
}) {
  return ([args]) async {
    final params = args?.params?.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');

    final input = args?.input ?? () => {};

    final res = await http.post(
      Uri.parse(
        '$host'
        '$route'
        '?${params ?? ''}',
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: jsonEncode(input()),
    );

    return await outputFromBodyAsync(
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
    required RouterFetchOutputFromBodyAsync<TQueryOutput> query,
    required RouterFetchOutputFromBodyAsync<TMutationOutput> mutation,
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
    required RouterFetchOutputFromBodyAsync<TQueryOutput> query,
    required RouterFetchOutputFromBodyAsync<TMutationOutput> mutation,
  }) {
    this.query = createRouterFetchQuery<TQueryOutput>(
      route: route,
      outputFromBodyAsync: query,
    );
    this.mutation = createRouterFetchMutation(
      route: route,
      outputFromBodyAsync: mutation,
    );
  }
}
