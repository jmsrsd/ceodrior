import 'package:ceodrior/utils/add_post_frame_callback.dart';
import 'package:drpc/drpc.dart';
import 'package:flutter/material.dart';

BuildContext? _context;

typedef OnContext = void Function(
  BuildContext context,
);

void onContext(BuildContext context) {
  _context = context;
}

void addOnContextCallback(OnContext callback) {
  addPostFrameCallback(() {
    try {
      callback(_context as BuildContext);
    } catch (e) {
      noop();
    }
  });
}
