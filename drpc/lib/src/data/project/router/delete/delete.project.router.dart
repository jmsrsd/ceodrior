import 'package:drpc/drpc.dart';
export 'output/delete.project.router.output.dart';
export 'input/delete.project.router.input.dart';

final deleteProjectRouter =
    Router<DeleteProjectRouterInput, DeleteProjectRouterOutput>(
  route: '/api/project/delete',
  input: RouterIO<DeleteProjectRouterInput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return DeleteProjectRouterInput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
  output: RouterIO<DeleteProjectRouterOutput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return DeleteProjectRouterOutput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
);
