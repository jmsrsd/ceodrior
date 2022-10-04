import 'package:drpc/drpc.dart';
export 'output/read.project.router.output.dart';
export 'input/read.project.router.input.dart';

final readProjectRouter =
    Router<ReadProjectRouterInput, ReadProjectRouterOutput>(
  route: '/api/project/read',
  input: RouterIO<ReadProjectRouterInput>(
    encoder: (decoded) {
      return decoded?.toJson();
    },
    decoder: (encoded) {
      try {
        return ReadProjectRouterInput.fromJson(encoded!);
      } catch (e) {
        return null;
      }
    },
  ),
  output: RouterIO<ReadProjectRouterOutput>(
    encoder: (decoded) {
      return decoded?.toJson();
    },
    decoder: (encoded) {
      try {
        return ReadProjectRouterOutput.fromJson(encoded!);
      } catch (e) {
        return null;
      }
    },
  ),
);
