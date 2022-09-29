import 'package:flutter/material.dart';

addPostFrameCallback(dynamic Function() callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) => callback());
}
