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
typedef ConfigureRouter = void Function(Router router);

void configureRouter(Router router) {
  final configures = <String, List<ConfigureRouter>>{
    'hello': [
      RouterConfig(
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
      ).configure,
    ],
    'project': [
      RouterConfig(
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
      ).configure,
      RouterConfig(
        router: drpc.addProjectRouter,
        type: RouterType.mutation,
        resolver: (input) async {
          final db = await projectDB();
          final key = drpc.cuid();
          final value = drpc.ProjectEntity(
            id: key,
            title: Lorem.sentence(),
            author: 'John Doe',
            content: List.generate(5, (index) {
              return Lorem.sentence(numSentences: 5);
            }).join('\n\n'),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          await db.put(key, value);
          return drpc.noop();
        },
      ).configure,
      RouterConfig(
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
      ).configure,
      RouterConfig(
        router: drpc.readProjectRouter,
        type: RouterType.query,
        resolver: (input) async {
          final id = '${input?.id}';
          final db = await projectDB();
          final defaultProject = drpc.ProjectEntity(
            id: id,
            title: '',
            author: '',
            content: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          return drpc.ReadProjectRouterOutput(
            project: db.get(id) ?? defaultProject,
          );
        },
      ).configure,
      RouterConfig(
        router: drpc.editProjectRouter,
        type: RouterType.mutation,
        resolver: (input) async {
          try {
            final project = input?.project as drpc.ProjectEntity;
            final db = await projectDB();
            await db.put(
              project.id,
              project.copyWith(
                updatedAt: DateTime.now(),
              ),
            );
          } catch (e) {
            drpc.noop();
          }
          return drpc.noop();
        },
      ).configure,
    ],
  };

  configures.values.reduce((v, e) {
    return [...v, ...e];
  }).forEach((configure) {
    configure(router);
  });
}

void configureDB() {
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
}

final _router = Router();

// final _router = Router()
//   ..get('/', _rootHandler)
//   ..get('/echo/<message>', _echoHandler);

// Response _rootHandler(Request req) {
//   return Response.ok('Hello, World!\n');
// }

// Response _echoHandler(Request request) {
//   final message = request.params['message'];
//   return Response.ok('$message\n');
// }

void main(List<String> args) async {
  // Configure DB
  configureDB();

  // Configure endpoints
  configureRouter(_router);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders()) // Enable CORS
      .addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
