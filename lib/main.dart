// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'context.dart';
import 'router.dart';
import 'theme.dart';
import 'utils/add_post_frame_callback.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   url: 'https://yxoywupdfspjirpwfiuh.supabase.co',
  //   anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
  //       '.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4b3l3dXBkZnNwamlycHdmaXVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTk0MzU1NDEsImV4cCI6MTk3NTAxMTU0MX0'
  //       '.T4O1E2hbxN30CZuyNq5epJD5igMUDXmCDalNW_nV4E8',
  // );

  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ceodrior',
      theme: theme,
      builder: (context, child) {
        addPostFrameCallback(() {
          onContext(context);
        });
        return child ?? const SizedBox();
      },
      initialRoute: initialRoute,
      onGenerateRoute: router,
    );
  }
}
