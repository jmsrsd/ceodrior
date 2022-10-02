import 'dart:async';

FutureOr<T?> uncatch<T>(FutureOr<T> Function() computation) async {
  try {
    return await computation();
  } catch (_) {
    return null;
  }
}
