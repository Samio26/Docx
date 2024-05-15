import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

 Future<void> saveToSecureStorage(String key, dynamic value) async {
  switch (value.runtimeType) {
    case String:
      await _secureStorage.write(key: key, value: value);
      break;
    case int:
      await _secureStorage.write(key: key, value: value.toString());
      break;
    case double:
      await _secureStorage.write(key: key, value: value.toString());
      break;
    case bool:
      await _secureStorage.write(key: key, value: value.toString());
      break;
    default:
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
  }
}



Future<T?> getFromSecureStorage<T>(String key) async {
  final value = await _secureStorage.read(key: key);
  if (value == null) {
    return null;
  }

  switch (T) {
    case String:
      return value as T;
    case int:
      return int.tryParse(value) as T?;
    case double:
      return double.tryParse(value) as T?;
    case bool:
      if (value.toLowerCase() == 'true') {
        return true as T;
      } else if (value.toLowerCase() == 'false') {
        return false as T;
      } else {
        throw FormatException('Invalid boolean value: $value');
      }
    default:
      throw ArgumentError('Unsupported type: $T');
  }
}

