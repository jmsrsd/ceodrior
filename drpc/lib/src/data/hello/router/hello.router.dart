import 'package:drpc/drpc.dart';

export 'output/hello.router.output.dart';

final helloRouter = Router(
  route: '/api/hello',
  query: (json) async {
    return HelloRouterOutput.fromJson(json);
  },
  mutation: (json) async {},
  resolver: (args) async {
    return HelloRouterOutput(
      say: 'Hello, ${args.params['name']}!',
      error: '${args.errors}',
    ).toJson;
  },
);
