import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constants.dart';

abstract class AuthHookWidget extends StatefulHookWidget {
  const AuthHookWidget({super.key});

  Widget build(AuthHookWidgetState auth);

  @override
  AuthHookWidgetState createState() => AuthHookWidgetState();
}

class AuthHookWidgetState extends SupabaseAuthState<AuthHookWidget> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (route) => false,
      );
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/account',
        (route) => false,
      );
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    context.showErrorSnackBar(message: message);
  }

  @override
  Widget build(context) => widget.build(this);
}
