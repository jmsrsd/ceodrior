import 'package:flutter_hooks/flutter_hooks.dart';

class Refresh {
  late final DateTime _;
  final void Function() now;

  Refresh({
    required DateTime dateTime,
    required this.now,
  }) {
    _ = dateTime;
  }

  @override
  int get hashCode => _.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Refresh && other._ == _;
  }
}

Refresh useRefresh() {
  final dateTime = useState(DateTime.now());
  return Refresh(
    dateTime: dateTime.value,
    now: () => dateTime.value = DateTime.now(),
  );
}
