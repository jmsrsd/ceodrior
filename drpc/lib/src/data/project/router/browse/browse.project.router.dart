import 'package:drpc/drpc.dart';

export 'output/browse.project.router.output.dart';

final browseProjectRouter = Router<void, BrowseProjectRouterOutput>(
  route: '/api/project/browse',
  input: null,
  output: RouterIO<BrowseProjectRouterOutput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return BrowseProjectRouterOutput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
);
