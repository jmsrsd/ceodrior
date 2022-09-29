// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/auth_hook_widget.dart';
import '../utils/constants.dart';

class LoginPage extends AuthHookWidget {
  const LoginPage({super.key});

  @override
  Widget build(auth) {
    final context = useContext();
    final isLoading = useState(false);
    final emailController = useTextEditingController();

    void signIn() {
      isLoading.value = true;

      supabase.auth
          .signIn(
        email: emailController.text,
        options: AuthOptions(
          redirectTo:
              kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
        ),
      )
          .then((response) {
        final error = response.error;

        if (error != null) {
          context.showErrorSnackBar(
            message: error.message,
          );
        } else {
          context.showSnackBar(
            message: 'Check your email for login link!',
          );
          emailController.clear();
        }

        isLoading.value = false;
      });
    }

    useEffect(() {
      if (supabase.auth.session() != null) {
        auth.recoverSupabaseSession();
      }
      return () {};
    }, [supabase.auth, auth]);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: SizedBox(
          width: 360,
          height: double.maxFinite,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            children: [
              const Text('Sign in via the magic link with your email below'),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              ElevatedButton(
                onPressed: isLoading.value ? null : signIn,
                child: Text(isLoading.value ? 'LOADING...' : 'SEND MAGIC LINK'),
              ),
            ]
                .map((e) => [const SizedBox(height: 18), e])
                .reduce((value, element) => [...value, ...element])
                .sublist(1),
          ),
        ),
      ),
    );
  }
}
