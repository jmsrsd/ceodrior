import 'package:ceodrior/utils/execute.dart';
import 'package:flutter/material.dart';

ThemeData theme = execute(() {
  var theme = ThemeData.light();
  theme = theme.copyWith(
    appBarTheme: theme.appBarTheme.copyWith(
      backgroundColor: theme.scaffoldBackgroundColor,
      foregroundColor: theme.colorScheme.onSurface,
    ),
    primaryTextTheme: theme.textTheme,
  );
  return theme;
});
