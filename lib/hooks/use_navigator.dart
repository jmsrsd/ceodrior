import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

NavigatorState useNavigator() {
  return Navigator.of(useContext());
}
