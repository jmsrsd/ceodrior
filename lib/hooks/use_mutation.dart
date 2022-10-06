import 'dart:async';

import 'package:drpc/drpc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Mutation<TInput, TOutput> {
  final bool isLoading;
  final Mutate<TInput?, TOutput?> mutate;

  Mutation({
    required this.isLoading,
    required this.mutate,
  });
}

typedef Mutate<TInput, TOutput> = Future<void> Function({
  TInput? input,
  MutateOpts<TOutput?> opts,
});

class MutateOpts<T> {
  final FutureOr<void> Function(T? value)? then;
  final FutureOr<void> Function(dynamic err)? catchError;
  final FutureOr<void> Function()? whenComplete;

  const MutateOpts({
    this.then,
    this.catchError,
    this.whenComplete,
  });
}

Mutation<TInput?, TOutput?> useMutation<TInput, TOutput>(
  List keys,
  Future<TOutput?> Function({TInput? input}) fetch, {
  MutateOpts<TOutput?>? mutateOpts,
}) {
  final mutations = useState(0);
  return Mutation<TInput?, TOutput?>(
    isLoading: mutations.value > 0,
    mutate: useMemoized<Mutate<TInput?, TOutput?>>(() {
      return ({
        TInput? input,
        MutateOpts<TOutput?>? opts,
      }) async {
        mutations.value++;

        await fetch(input: input).then((value) async {
          await uncatch(() async {
            await (opts?.then ?? mutateOpts?.then)!(value);
          });
        }).catchError((err) async {
          await uncatch(() async {
            await (opts?.catchError ?? mutateOpts?.catchError)!(err);
          });
        }).whenComplete(() async {
          await uncatch(() async {
            await (opts?.whenComplete ?? mutateOpts?.whenComplete)!();
          });

          mutations.value--;
        });
      };
    }, [mutations.value, ...keys]),
  );
}
