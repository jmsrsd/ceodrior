import 'package:drpc/drpc.dart';

export 'output/browse.project.router.output.dart';

final browseProjectRouter = Router(
  route: '/api/project/browse',
  query: (json) async {
    return BrowseProjectRouterOutput.fromJson(json);
  },
  mutation: (json) async {},
  resolver: (args) async {
    return BrowseProjectRouterOutput.fromJson(
      args.body,
    ).toJson;
  },
);
