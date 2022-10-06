import 'dart:async';

import 'package:drpc/drpc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'use_refresh.dart';

QuerySnapshot<T?> useQuery<T>(
  List keys,
  Future<T?> Function() fetch, {
  Duration refetchInterval = const Duration(minutes: 5),
}) {
  final fetching = useRefresh();

  final timer = useMemoized(() {
    return Timer(
      refetchInterval,
      fetching.now,
    );
  }, [fetching]);

  final memoized = useMemoized(() {
    return CancelableFuture<T?>(fetch);
  }, [fetching, ...keys]);

  final snapshot = useFuture(memoized);

  return QuerySnapshot<T?>(
    snapshot: snapshot,
    refetch: useCallback(() {
      memoized.cancel();
      timer.cancel();
      fetching.now();
    }, [memoized, timer, fetching]),
  );
}

class QuerySnapshot<T> implements AsyncSnapshot<T> {
  late final AsyncSnapshot<T> _;
  final void Function() refetch;

  QuerySnapshot({
    required AsyncSnapshot<T> snapshot,
    required this.refetch,
  }) {
    _ = snapshot;
  }

  bool get isLoading => _.connectionState != ConnectionState.done;

  @override
  ConnectionState get connectionState => _.connectionState;

  @override
  T? get data => _.data;

  @override
  T get requireData => _.requireData;

  @override
  Object? get error => _.error;

  @override
  StackTrace? get stackTrace => _.stackTrace;

  @override
  AsyncSnapshot<T> inState(ConnectionState state) => _.inState(state);

  @override
  bool get hasData => _.hasData;

  @override
  bool get hasError => _.hasError;
}
