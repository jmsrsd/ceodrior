import 'dart:async';

import 'wait_until.dart';

class CancelableFuture<T> implements Future<T?> {
  late final Future<T?> _;
  bool _canceled = false;

  CancelableFuture(
    FutureOr<T?> Function() computation,
  ) {
    _ = Future.any([
      Future(computation),
      waitUntil(() {
        return _canceled;
      }).then((_) {
        return null;
      }),
    ]);
  }

  bool get canceled {
    return _canceled;
  }

  void cancel() {
    _canceled = true;
  }

  @override
  Stream<T?> asStream() => _.asStream();

  @override
  Future<T?> catchError(
    Function onError, {
    bool Function(Object error)? test,
  }) {
    return _.catchError(onError, test: test);
  }

  @override
  Future<R> then<R>(
    FutureOr<R> Function(T? value) onValue, {
    Function? onError,
  }) {
    return _.then(onValue, onError: onError);
  }

  @override
  Future<T?> timeout(
    Duration timeLimit, {
    FutureOr<T?> Function()? onTimeout,
  }) {
    return _.timeout(timeLimit, onTimeout: onTimeout);
  }

  @override
  Future<T?> whenComplete(FutureOr<void> Function() action) {
    return _.whenComplete(action);
  }
}
