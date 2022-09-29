import 'package:drpc/drpc.dart';

export 'output/hello.router.output.dart';

const helloRouterRoute = '/api/hello';

final helloRouter = Router(
  request: createRouterRequest(
    route: helloRouterRoute,
    outputFromJsonAsync: (json) async {
      return HelloRouterOutput.fromJson(json);
    },
  ),
  handler: (args) async {
    return HelloRouterOutput(
      say: 'Hello, ${args.params['name']}!',
      error: '${args.errors}',
    );
  },
);
