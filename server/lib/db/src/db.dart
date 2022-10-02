import 'package:hive/hive.dart';

class DB<T> implements Box<T> {
  final Box<String> connection;

  late final String Function(T decoded) encode;
  late final T Function(String encoded) decode;

  DB._({
    required this.connection,
    required String Function(T decoded) encoder,
    required T Function(String encoded) decoder,
  }) {
    encode = encoder;
    decode = decoder;
  }

  static Future<DB<T>> open<T>(
    String name, {
    required String Function(T decoded) encoder,
    required T Function(String encoded) decoder,
  }) async {
    return DB<T>._(
      connection: await Hive.openBox<String>(name),
      encoder: encoder,
      decoder: decoder,
    );
  }

  @override
  Future<int> add(T value) async {
    return await connection.add(encode(value));
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) async {
    return await connection.addAll(values.map(encode));
  }

  @override
  Future<int> clear() async {
    return await connection.clear();
  }

  @override
  Future<void> close() async {
    return await connection.close();
  }

  @override
  Future<void> compact() async {
    return await connection.compact();
  }

  @override
  bool containsKey(key) {
    return connection.containsKey(key);
  }

  @override
  Future<void> delete(key) async {
    return await connection.delete(key);
  }

  @override
  Future<void> deleteAll(Iterable keys) async {
    return await connection.deleteAll(keys);
  }

  @override
  Future<void> deleteAt(int index) async {
    return await connection.deleteAt(index);
  }

  @override
  Future<void> deleteFromDisk() async {
    return await connection.deleteFromDisk();
  }

  @override
  Future<void> flush() async {
    return await connection.flush();
  }

  @override
  T? get(key, {T? defaultValue}) {
    try {
      return decode(
        connection.get(
          key,
          defaultValue: defaultValue == null ? null : encode(defaultValue),
        )!,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  T? getAt(int index) {
    try {
      return decode(
        connection.getAt(index)!,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  bool get isEmpty => connection.isEmpty;

  @override
  bool get isNotEmpty => connection.isNotEmpty;

  @override
  bool get isOpen => connection.isOpen;

  @override
  keyAt(int index) {
    return connection.keyAt(index);
  }

  @override
  Iterable get keys => connection.keys;

  @override
  bool get lazy => connection.lazy;

  @override
  int get length => connection.length;

  @override
  String? get path => connection.path;

  @override
  Future<void> put(key, T value) async {
    return await connection.put(key, encode(value));
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    return await connection.putAll(
      Map.fromEntries(
        entries.entries.map((e) {
          return MapEntry(e.key, encode(e.value));
        }),
      ),
    );
  }

  @override
  Future<void> putAt(int index, T value) async {
    return await connection.putAt(index, encode(value));
  }

  @override
  Map<dynamic, T> toMap() {
    return Map.fromEntries(
      connection.toMap().entries.map((e) {
        return MapEntry(e.key, decode(e.value));
      }),
    );
  }

  @override
  Iterable<T> get values => connection.values.map((decode));

  @override
  Iterable<T> valuesBetween({startKey, endKey}) {
    return connection
        .valuesBetween(
          startKey: startKey,
          endKey: endKey,
        )
        .map(decode);
  }

  @override
  Stream<BoxEvent> watch({key}) {
    return connection.watch(key: key);
  }

  @override
  String get name => connection.name;
}
