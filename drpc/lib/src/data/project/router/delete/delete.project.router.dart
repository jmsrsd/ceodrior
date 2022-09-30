import 'package:drpc/drpc.dart';
export 'output/delete.project.router.output.dart';
export 'input/delete.project.router.input.dart';

final deleteProjectRouter = Router<void, DeleteProjectRouterOutput>(
  route: '/api/project/delete',
  query: (body) async {},
  mutation: (body) async {
    return DeleteProjectRouterOutput.fromJson(body);
  },
  resolver: (args) async {
    return DeleteProjectRouterOutput.fromJson(
      args.body,
    ).toJson;
  },
);
