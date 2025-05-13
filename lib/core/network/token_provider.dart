import '../../config/storage/app_storage.dart';

class TokenProvider {
  Future<String?> getToken() async {
    return SharedPrefsStorage.getToken();
  }
}
