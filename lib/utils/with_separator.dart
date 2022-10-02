import 'package:flutter/material.dart';

List<Widget> withSeparator({
  Widget? separator,
  required List<Widget> children,
}) {
  try {
    return children
        .map((e) => [separator ?? const SizedBox(), e])
        .reduce((value, element) => [...value, ...element])
        .sublist(1);
  } catch (e) {
    return [];
  }
}
