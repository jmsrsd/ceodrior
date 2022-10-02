// ignore_for_file: non_constant_identifier_names

import 'package:drpc/drpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../components/auth_required_hook_widget.dart';
import '../utils/constants.dart';
import '../utils/mutable.dart';
import '../utils/wait_until.dart';

class AccountPage extends AuthRequiredHookWidget {
  AccountPage({super.key});

  final getProfile = Mutable<void Function(String userId)>();

  @override
  void onAuthenticated(session, auth) {
    if (auth.mounted) {
      final user = session.user;
      if (user != null) {
        waitUntil(() => getProfile.isNotNull).then((_) {
          getProfile.value(user.id);
        });
      }
    }
  }

  @override
  Widget build(auth) {
    final context = useContext();
    final isLoading = useState(false);
    final usernameController = useTextEditingController();
    final websiteController = useTextEditingController();

    /// Called once a user id is received within `onAuthenticated()`
    getProfile.value = (String userId) {
      isLoading.value = true;
      supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single()
          .execute()
          .then((response) {
        final error = response.error;
        if (error != null && response.status != 406) {
          context.showErrorSnackBar(message: error.message);
        }
        final data = response.data;
        if (data != null) {
          usernameController.text = (data['username'] ?? '') as String;
          websiteController.text = (data['website'] ?? '') as String;
        }
        isLoading.value = false;
      });
    };

    /// Called when user taps `Update` button
    void updateProfile() {
      isLoading.value = true;
      final userName = usernameController.text;
      final website = websiteController.text;
      final user = supabase.auth.currentUser;
      final updates = {
        'id': user!.id,
        'username': userName,
        'website': website,
        'updated_at': DateTime.now().toIso8601String(),
      };
      supabase.from('profiles').upsert(updates).execute().then((response) {
        final error = response.error;
        if (error != null) {
          context.showErrorSnackBar(message: error.message);
        } else {
          context.showSnackBar(message: 'Successfully updated profile!');
        }
        isLoading.value = false;
      });
    }

    void signOut() {
      supabase.auth.signOut().then((response) {
        final error = response.error;
        if (error != null) {
          context.showErrorSnackBar(message: error.message);
        }
      });
    }

    final helloQuery = useFuture(
      useMemoized(() {
        return helloRouter.query(
          input: HelloRouterInput(
            name: usernameController.text,
          ),
        );
      }, [usernameController.text]),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: isLoading.value ? null : 1,
          ),
          const SizedBox(height: 18),
          Text(
            helloQuery.connectionState != ConnectionState.done
                ? 'Loading...'
                : '${helloQuery.data?.say}',
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 360,
                height: double.maxFinite,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 12,
                  ),
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'My name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: websiteController,
                      decoration: const InputDecoration(
                        labelText: 'My website',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: updateProfile,
                      child: Text(isLoading.value ? 'SAVING...' : 'UPDATE'),
                    ),
                    ElevatedButton(
                      onPressed: signOut,
                      child: const Text('SIGN OUT'),
                    ),
                  ]
                      .map((e) => [const SizedBox(height: 18), e])
                      .reduce((value, element) => [...value, ...element])
                      .sublist(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
