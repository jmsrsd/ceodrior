import 'package:drpc/drpc.dart';
export 'input/edit.project.router.input.dart';

final editProjectRouter = Router<EditProjectRouterInput, void>(
  route: '/api/project/edit',
  input: RouterIO<EditProjectRouterInput>(
    encoder: (decoded) {
      return decoded?.toJson();
    },
    decoder: (encoded) {
      try {
        return EditProjectRouterInput.fromJson(encoded!);
      } catch (e) {
        return null;
      }
    },
  ),
  output: null,
);
