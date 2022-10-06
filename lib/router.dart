import 'package:flutter/material.dart';

import 'pages/project_page.dart';
import 'utils/add_post_frame_callback.dart';

const initialRoute = '/';

Route<dynamic>? router(RouteSettings settings) {
  var route = settings.name ?? initialRoute;

  final routing = route.split('/').where((e) {
    return e.isNotEmpty;
  }).toList();

  WidgetBuilder builder = (_) => const ProjectMainPage();

  try {
    switch (routing.first) {
      case 'project':
        if (routing.length <= 1) throw Error();
        final id = routing[1];
        builder = (_) => ProjectDetailPage(id: id);
        break;
      default:
        throw Error();
    }
  } catch (e) {
    if (route != initialRoute) {
      builder = (context) {
        addPostFrameCallback(() {
          final navigator = Navigator.of(context);
          navigator.pushNamedAndRemoveUntil(initialRoute, (route) => false);
        });
        return const SizedBox();
      };
    }
  }

  return MaterialPageRoute(
    settings: settings,
    builder: builder,
  );
}
