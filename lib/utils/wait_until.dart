Future<void> waitUntil(bool Function() condition) async {
  while (condition() == false) {
    await Future.delayed(Duration.zero);
  }
}
