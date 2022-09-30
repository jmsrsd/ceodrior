import 'package:drpc/drpc.dart';

final addProjectRouter = Router<void, void>(
  route: '/api/project/add',
  query: (body) async {},
  mutation: (body) async {},
  resolver: (args) async {
    return () => const <String, dynamic>{};
  },
);
