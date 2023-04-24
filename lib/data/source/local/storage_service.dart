import 'package:injectable/injectable.dart';
import 'package:new_folder_structure/data/source/local/preferences.dart';
import 'package:new_folder_structure/data/source/local/secure_storage.dart';

@singleton
class StorageService {
  StorageService(
    this._preferences,
    this._secureStorage,
  );

  final Preferences _preferences;
  final SecureStorage _secureStorage;

  static const authToken = "authToken";
  static const loginStatus = "loginStatus";

  Future clearAll() async {
    _preferences.clearAll();
    await _secureStorage.clearAll();
  }

  Future<String> getAuthToken() async => await _secureStorage.secureGet(authToken);

  Future setAuthToken(String value) async {
    await _secureStorage.secureSet(authToken, value);
  }

  Future<bool> getLoginStatus() async => await _preferences.getBool(loginStatus);

  Future setLoginStatus(bool value) async {
    await _preferences.setBool(loginStatus, value);
  }
}
