import 'package:drpc/drpc.dart';
export 'output/delete.project.router.output.dart';
export 'input/delete.project.router.input.dart';

final deleteProjectRouter =
    Router<DeleteProjectRouterInput, DeleteProjectRouterOutput>(
  route: '/api/project/delete',
  input: RouterIO<DeleteProjectRouterInput>(
    encoder: (decoded) {
      return decoded?.toJson();
    },
    decoder: (encoded) {
      try {
        return DeleteProjectRouterInput.fromJson(encoded!);
      } catch (e) {
        return null;
      }
    },
  ),
  output: RouterIO<DeleteProjectRouterOutput>(
    encoder: (decoded) {
      return decoded?.toJson();
    },
    decoder: (encoded) {
      try {
        return DeleteProjectRouterOutput.fromJson(encoded!);
      } catch (e) {
        return null;
      }
    },
  ),
);
