// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/account_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yxoywupdfspjirpwfiuh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
        '.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4b3l3dXBkZnNwamlycHdmaXVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTk0MzU1NDEsImV4cCI6MTk3NTAxMTU0MX0'
        '.T4O1E2hbxN30CZuyNq5epJD5igMUDXmCDalNW_nV4E8',
  );

  runApp(MyApp(title: 'FCMS Flutter'));
}

class MyApp extends HookWidget {
  MyApp({
    required this.title,
  }) : super(key: ValueKey(title));

  final String title;

  @override
  Widget build(context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.green,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => AccountPage(),
      },
    );
  }
}
