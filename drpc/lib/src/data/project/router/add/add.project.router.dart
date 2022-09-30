import 'package:drpc/drpc.dart';

final addProjectRouter = Router(
  route: '/api/project/add',
  query: (json) async {},
  mutation: (json) async {},
  resolver: (args) async {
    return () => const <String, dynamic>{};
  },
);
