import 'package:dio/dio.dart';
import '../../../../core/network/mock_server/mock_datasource.dart';
import '../../../../core/error/app_exception.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(Dio dio);

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Use mock datasource for now
      final response = await MockDataSource.login(email, password);
      return response;
    } catch (e) {
      if (e is DioException) {
        throw ServerException(
          e.response?.data['error'] ?? 'Login failed',
          statusCode: e.response?.statusCode,
          originalError: e,
        );
      }
      throw NetworkException('Login failed', originalError: e);
    }
  }

  @override
  Future<void> logout() async {
    // In real implementation, this would call the API
    await Future.delayed(const Duration(milliseconds: 100));
  }
}

