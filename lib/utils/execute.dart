T execute<T>(T Function() fn) => fn();

Future<T> executeAsync<T>(Future<T> Function() fn) async => await fn();
