// ignore_for_file: non_constant_identifier_names

import 'package:ceodrior/utils/add_post_frame_callback.dart';
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

  runApp(const MyApp());
}

class MyApp extends HookWidget {
  static BuildContext? _context;

  const MyApp({super.key});

  static void onContext(
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

  static const title = 'ceodrior';
  static const initialRoute = '/';

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
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        var route = settings.name ?? initialRoute;
        final routing = route.split('/').where((e) => e.isNotEmpty).toList();
        WidgetBuilder builder = (_) => const ProjectMainPage();
        try {
          switch (routing.first) {
            case 'project':
              if (routing.length > 1) {
                final id = routing[1];
                builder = (_) => ProjectDetailPage(id: id);
                break;
              }
              throw Error();
            default:
              throw Error();
          }
        } catch (e) {
          if (route != initialRoute) {
            builder = (context) {
              addPostFrameCallback(() {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  initialRoute,
                  (route) => false,
                );
              });
              return const SizedBox();
            };
          }
        }
        return MaterialPageRoute(
          settings: settings,
          builder: builder,
        );
      },
    );
  }
}
