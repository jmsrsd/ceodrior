import 'package:drpc/drpc.dart';

export 'output/browse.project.router.output.dart';

final browseProjectRouter = Router<BrowseProjectRouterOutput, void>(
  route: '/api/project/browse',
  query: (body) async {
    return BrowseProjectRouterOutput.fromJson(body);
  },
  mutation: (body) async {},
  resolver: (args) async {
    return BrowseProjectRouterOutput.fromJson(
      args.body,
    ).toJson;
  },
);
