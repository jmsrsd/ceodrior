// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../components/auth_hook_widget.dart';

class SplashPage extends AuthHookWidget {
  const SplashPage({super.key});

  @override
  Widget build(auth) {
    final sessionRecovery = useFuture(
      useMemoized(auth.recoverSupabaseSession, [auth]),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 36,
              height: 36,
              child: CircularProgressIndicator(),
            ),
            Text(sessionRecovery.connectionState.name)
          ]
              .map((e) => [const SizedBox(height: 18), e])
              .reduce((value, element) => [...value, ...element])
              .sublist(1),
        ),
      ),
    );
  }
}
