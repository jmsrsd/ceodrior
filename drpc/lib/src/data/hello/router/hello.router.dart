import 'package:drpc/drpc.dart';
export 'input/hello.router.input.dart';
export 'output/hello.router.output.dart';

final helloRouter = Router<HelloRouterInput, HelloRouterOutput>(
  route: '/api/hello',
  input: RouterIO<HelloRouterInput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return HelloRouterInput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
  output: RouterIO<HelloRouterOutput>(
    encoder: (decoded) => decoded?.toJson(),
    decoder: (encoded) {
      try {
        return HelloRouterOutput.fromJson(
          encoded as RouterEncodedIO,
        );
      } catch (e) {
        return null;
      }
    },
  ),
);
