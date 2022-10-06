T execute<T>(T Function() fn) => fn();

Future<T> executeAsync<T>(Future<T> Function() fn) async => await fn();

T executeWhen<T>(
  bool Function() when, {
  required T Function() then,
  required T Function() or,
}) {
  return when() ? then() : or();
}

Future<T> executeWhenAsync<T>(
  Future<bool> Function() when, {
  required Future<T> Function() then,
  required Future<T> Function() or,
}) async {
  return await when() ? await then() : await or();
}
