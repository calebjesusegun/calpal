import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../app/app.logger.dart';

class SecureStorageService {
  final _logger = getLogger('SecureStorageService');
  final String _username = 'username';
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  Future<void> deleteUsername() async {
    try {
      await _flutterSecureStorage.delete(key: _username);
    } catch (e, s) {
      _logger.e('error trying to delete username', e, s);
    }
  }

  Future<String?> readUsername() async {
    try {
      return await _flutterSecureStorage.read(key: _username);
    } catch (e, s) {
      _logger.e('error trying to read username data', e, s);
      return null;
    }
  }

  Future<void> writeUsername({required String? username}) async {
    try {
      await _flutterSecureStorage.write(
        key: _username,
        value: username,
      );
      _logger.i('username data saved');
    } catch (e, s) {
      _logger.e('error trying to write username data', e, s);
    }
  }
}
