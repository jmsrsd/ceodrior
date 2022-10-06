import 'package:drpc/drpc.dart';
export 'output/read.project.router.output.dart';
export 'input/read.project.router.input.dart';

final readProjectRouter =
    Router<ReadProjectRouterInput, ReadProjectRouterOutput>(
  route: '/api/project/read',
  input: RouterIO<ReadProjectRouterInput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return ReadProjectRouterInput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
  output: RouterIO<ReadProjectRouterOutput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return ReadProjectRouterOutput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
);
