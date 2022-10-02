// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:drpc/drpc.dart' as drpc;
import 'package:hive/hive.dart';
import 'package:lorem_gen/lorem_gen.dart';
import 'package:path/path.dart' as path;
import 'package:server/db/project.db.dart';
import 'package:server/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = (() {
  final router = Router();

  void endpoint<TInput, TOutput>({
    required RouterConfig<TInput, TOutput> config,
  }) {
    final route = config.router.route;
    final handler = createRouterHandler<TInput, TOutput>(config: config);
    switch (config.type) {
      case RouterType.query:
        router.get(route, handler);
        break;
      case RouterType.mutation:
        router.post(route, handler);
        break;
    }
  }

  endpoint(
    config: RouterConfig(
      router: drpc.helloRouter,
      type: RouterType.query,
      resolver: (input) async {
        try {
          return drpc.HelloRouterOutput(
            say: 'Hello, ${input?.name}!',
          );
        } catch (e) {
          return drpc.HelloRouterOutput(
            error: '$e',
          );
        }
      },
    ),
  );

  endpoint(
    config: RouterConfig(
      router: drpc.browseProjectRouter,
      type: RouterType.query,
      resolver: (input) async {
        try {
          final db = await projectDB();
          final projects = db.values.toList();
          return drpc.BrowseProjectRouterOutput(
            projects: projects.reversed.toList(),
          );
        } catch (e) {
          return null;
        }
      },
    ),
  );

  endpoint(
    config: RouterConfig(
      router: drpc.addProjectRouter,
      type: RouterType.mutation,
      resolver: (input) async {
        final db = await projectDB();
        final key = drpc.cuid();
        final value = drpc.ProjectEntity(
          id: key,
          name: Lorem.sentence(),
        );
        await db.put(key, value);

        return null;
      },
    ),
  );

  endpoint(
    config: RouterConfig(
      router: drpc.deleteProjectRouter,
      type: RouterType.mutation,
      resolver: (input) async {
        final id = '${input?.id}';
        try {
          final db = await projectDB();
          await db.delete(id);
        } catch (e) {
          drpc.noop();
        }
        return drpc.DeleteProjectRouterOutput(
          id: id,
        );
      },
    ),
  );

  return router;
})();

// final _router = Router()
//   ..get('/', _rootHandler)
//   ..get('/echo/<message>', _echoHandler)
//   ..get(
//     drpc.helloRouter.route,
//     createRouterHandler(
//       config: RouterConfig(
//         type: RouterType.query,
//         router: drpc.helloRouter,
//         resolver: (input) async {
//           try {
//             return drpc.HelloRouterOutput(
//               say: 'Hello, ${input?.name}!',
//             );
//           } catch (e) {
//             return drpc.HelloRouterOutput(
//               error: '$e',
//             );
//           }
//         },
//       ),
//     ),
//   )
//   ..get(
//     drpc.browseProjectRouter.route,
//     createRouterHandler(
//       config: RouterConfig(
//         type: RouterType.query,
//         router: drpc.browseProjectRouter,
//         resolver: (input) async {
//           try {
//             final db = await projectDB();
//             final projects = db.values.toList();
//             return drpc.BrowseProjectRouterOutput(
//               projects: projects.reversed.toList(),
//             );
//           } catch (e) {
//             return null;
//           }
//         },
//       ),
//     ),
//   )
//   ..post(
//     drpc.addProjectRouter.route,
//     createRouterHandler(
//       config: RouterConfig(
//         type: RouterType.mutation,
//         router: drpc.browseProjectRouter,
//         resolver: (input) async {
//           final db = await projectDB();
//           final key = drpc.cuid();
//           final value = drpc.ProjectEntity(
//             id: key,
//             name: Lorem.sentence(),
//           );
//           await db.put(key, value);

//           return null;
//         },
//       ),
//     ),
//   )
//   ..post(
//     drpc.deleteProjectRouter.route,
//     createRouterHandler(
//       config: RouterConfig(
//         type: RouterType.mutation,
//         router: drpc.deleteProjectRouter,
//         resolver: (input) async {
//           final id = '${input?.id}';
//           try {
//             final db = await projectDB();
//             await db.delete(id);
//           } catch (e) {
//             drpc.noop();
//           }
//           return drpc.DeleteProjectRouterOutput(
//             id: id,
//           );
//         },
//       ),
//     ),
//   );

// Response _rootHandler(Request req) {
//   return Response.ok('Hello, World!\n');
// }

// Response _echoHandler(Request request) {
//   final message = request.params['message'];
//   return Response.ok('$message\n');
// }

void main(List<String> args) async {
  // Init Hive
  final hivePath = path.context.normalize(
    path.absolute(
      path.join(
        path.dirname(Platform.script.path),
        '..',
        'db',
      ),
    ),
  );

  print('Hive path: $hivePath');

  Hive.init(hivePath);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
