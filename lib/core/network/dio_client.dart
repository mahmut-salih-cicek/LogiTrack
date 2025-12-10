import 'package:dio/dio.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/retry_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import '../storage/secure_storage_service.dart';

class DioClient {
  late final Dio _dio;
  final SecureStorageService _storage;

  DioClient(this._storage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.turusa.com', // Mock base URL
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(_storage),
      RetryInterceptor(),
    ]);
  }

  Dio get instance => _dio;
}

