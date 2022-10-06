import 'dart:convert';

import 'package:drpc/drpc.dart';
import 'package:http/http.dart' as http;

export 'resolver/router.resolver.dart';

typedef RouterEncodedIO = Map<String, dynamic>;
typedef RouterDecodedIO<T> = T;

typedef RouterIOEncoder<T> = RouterEncodedIO? Function(
  RouterDecodedIO<T>? decoded,
);

typedef RouterIODecoder<T> = RouterDecodedIO<T>? Function(
  RouterEncodedIO? encoded,
);

class RouterIO<T> {
  late final RouterIOEncoder<T> encode;
  late final RouterIODecoder<T> decode;

  RouterIO({
    required RouterIOEncoder<T> encoder,
    required RouterIODecoder<T> decoder,
  }) {
    encode = encoder;
    decode = decoder;
  }
}

class DefaultRouterIO<T> extends RouterIO<T> {
  DefaultRouterIO()
      : super(
          encoder: (decoded) => null,
          decoder: (encoded) => null,
        );
}

class Router<TInput, TOutput> {
  final String route;
  late final RouterIO<TInput> inputIO;
  late final RouterIO<TOutput> outputIO;

  Router({
    required this.route,
    RouterIO<TInput>? input,
    RouterIO<TOutput>? output,
  }) {
    inputIO = input ?? DefaultRouterIO<TInput>();
    outputIO = output ?? DefaultRouterIO<TOutput>();
  }

  String get endpoint {
    return '$host$route';
  }

  String? params(TInput? input) {
    return inputIO.encode(input)?.entries.map((e) {
      return '${e.key}=${e.value}';
    }).join('&');
  }

  Uri uri([TInput? input]) {
    return Uri.parse([endpoint, params(input)].where((e) {
      return e != null;
    }).join('?'));
  }

  Map<String, String> get headers {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }

  String? body(TInput? input) {
    try {
      final encoded = inputIO.encode(input) as Map<String, dynamic>;
      return jsonEncode(encoded);
    } catch (e) {
      return null;
    }
  }

  TOutput? putOut(http.Response res) {
    final Map<String, dynamic>? body = jsonDecode(res.body);
    return outputIO.decode(body);
  }

  Future<TOutput?> query({TInput? input}) async {
    return await http
        .get(
          uri(input),
        )
        .then(putOut)
        .catchError((err) => null);
  }

  Future<TOutput?> mutation({TInput? input}) async {
    return await http
        .post(
          uri(),
          headers: headers,
          body: body(input),
        )
        .then(putOut)
        .catchError((err) => null);
  }
}
