import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/logger.dart';
import '../error/app_exception.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userRoleKey = 'user_role';

  /// Token operations
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
      AppLogger.debug('Token saved');
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save token', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to save token', originalError: e, stackTrace: stackTrace);
    }
  }

  Future<String?> getToken() async {
    try {
      return await _storage.read(key: _tokenKey);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to read token', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to read token', originalError: e, stackTrace: stackTrace);
    }
  }

  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: _tokenKey);
      AppLogger.debug('Token deleted');
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete token', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to delete token', originalError: e, stackTrace: stackTrace);
    }
  }

  /// Refresh token operations
  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save refresh token', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to save refresh token', originalError: e, stackTrace: stackTrace);
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to read refresh token', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to read refresh token', originalError: e, stackTrace: stackTrace);
    }
  }

  /// User data operations
  Future<void> saveUserData({String? userId, String? role}) async {
    try {
      if (userId != null) {
        await _storage.write(key: _userIdKey, value: userId);
      }
      if (role != null) {
        await _storage.write(key: _userRoleKey, value: role);
      }
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save user data', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to save user data', originalError: e, stackTrace: stackTrace);
    }
  }

  Future<String?> getUserId() async {
    try {
      return await _storage.read(key: _userIdKey);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to read user id', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Future<String?> getUserRole() async {
    try {
      return await _storage.read(key: _userRoleKey);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to read user role', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Clear all data
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
      AppLogger.debug('All secure storage cleared');
    } catch (e, stackTrace) {
      AppLogger.error('Failed to clear storage', error: e, stackTrace: stackTrace);
      throw StorageException('Failed to clear storage', originalError: e, stackTrace: stackTrace);
    }
  }
}

