import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRequiredHookWidget extends StatefulHookWidget {
  const AuthRequiredHookWidget({super.key});

  void onAuthenticated(Session session, AuthRequiredHookWidgetState auth);

  Widget build(AuthRequiredHookWidgetState auth);

  @override
  AuthRequiredHookWidgetState createState() => AuthRequiredHookWidgetState();
}

class AuthRequiredHookWidgetState
    extends SupabaseAuthRequiredState<AuthRequiredHookWidget> {
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
    widget.onAuthenticated(session, this);
  }

  @override
  Widget build(context) => widget.build(this);
}
