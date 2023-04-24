import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

///Securely holds data in key,value pairs
@singleton
class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<String> secureGet(String key) async => await storage.read(key: key) ?? '';

  Future secureSet(String key, String value) async {
    if (value != '') {
      await storage.write(key: key, value: value);
    }
  }

  Future clearAll() async {
    await storage.deleteAll();
  }
}
