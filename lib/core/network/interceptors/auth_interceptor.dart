import 'package:dio/dio.dart';
import '../../storage/secure_storage_service.dart';
import '../../utils/logger.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _storage.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
        AppLogger.debug('Auth token added to request: ${options.path}');
      }
    } catch (e) {
      AppLogger.warning('Failed to add auth token', tag: 'AuthInterceptor');
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token expired or invalid
      AppLogger.warning('Unauthorized request, clearing token', tag: 'AuthInterceptor');
      try {
        await _storage.deleteToken();
      } catch (e) {
        AppLogger.error('Failed to clear token on 401', error: e);
      }
    }
    handler.next(err);
  }
}

