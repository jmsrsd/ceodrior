import 'dart:convert';

import 'package:drpc/drpc.dart';

import 'src/db.dart';

Future<DB<ProjectEntity>> projectDB() async {
  return await DB.open<ProjectEntity>(
    'project',
    encoder: (decoded) => jsonEncode(decoded.toJson()),
    decoder: (encoded) => ProjectEntity.fromJson(jsonDecode(encoded)),
  );
}
