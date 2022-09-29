class Mutable<T> {
  T? _;

  Mutable([T? value]) {
    _ = value;
  }

  T get value {
    return _ as T;
  }

  T? get valueOrNull {
    return _;
  }

  set value(T value) {
    _ = value;
  }

  bool get isNull {
    return _ == null;
  }

  bool get isNotNull {
    return _ != null;
  }
}
