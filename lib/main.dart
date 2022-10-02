// ignore_for_file: non_constant_identifier_names

import 'package:drpc/drpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'pages/project_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   url: 'https://yxoywupdfspjirpwfiuh.supabase.co',
  //   anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
  //       '.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4b3l3dXBkZnNwamlycHdmaXVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTk0MzU1NDEsImV4cCI6MTk3NTAxMTU0MX0'
  //       '.T4O1E2hbxN30CZuyNq5epJD5igMUDXmCDalNW_nV4E8',
  // );

  runApp(MyApp(title: 'FCMS Flutter'));
}

class MyApp extends HookWidget {
  static BuildContext? _context;

  static void useContext(
    void Function(BuildContext context) callback,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        callback(_context!);
      } catch (e) {
        noop();
      }
    });
  }

  MyApp({
    required this.title,
  }) : super(key: ValueKey(title));

  final String title;

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: (() {
        var theme = ThemeData.light();
        theme = theme.copyWith(
          appBarTheme: theme.appBarTheme.copyWith(
            backgroundColor: theme.scaffoldBackgroundColor,
            foregroundColor: theme.colorScheme.onSurface,
          ),
          primaryTextTheme: theme.textTheme,
        );
        return theme;
      })(),
      builder: (context, child) {
        return Scaffold(
          body: Builder(builder: (context) {
            _context = context;
            return SizedBox(child: child);
          }),
        );
      },
      initialRoute: '/project',
      routes: <String, WidgetBuilder>{
        // '/': (_) => const SplashPage(),
        // '/login': (_) => const LoginPage(),
        // '/account': (_) => AccountPage(),
        '/project': (_) => const ProjectPage(),
      },
    );
  }
}
