import '../../../drpc.dart';

export 'output/hello.router.output.dart';

const helloRouterRoute = '/api/hello';

final helloRouter = Router(
  route: helloRouterRoute,
  query: RouterQuery(
    request: createQueryRequest(
      helloRouterRoute,
      HelloRouterOutput.fromJson,
    ),
    resolver: (args) async {
      return HelloRouterOutput(
        say: 'Hello, ${args.params['name']}!',
        error: '${args.errors}',
      );
    },
  ),
);
