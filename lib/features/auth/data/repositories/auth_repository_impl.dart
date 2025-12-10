import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _storage;

  AuthRepositoryImpl(this._remoteDataSource, this._storage);

  @override
  Future<Result<User>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);
      
      final token = response['token'] as String;
      final refreshToken = response['refreshToken'] as String?;
      final userData = response['user'] as Map<String, dynamic>;

      final userDto = UserDto.fromJson(userData);
      final user = userDto.toEntity();

      // Save token and user data
      await _storage.saveToken(token);
      if (refreshToken != null) {
        await _storage.saveRefreshToken(refreshToken);
      }
      await _storage.saveUserData(userId: user.id, role: user.role);

      return Success(user);
    } on AppException catch (e) {
      return FailureResult(AuthFailure(e.message));
    } catch (e) {
      return FailureResult(UnknownFailure('Login failed: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _storage.clearAll();
      return const Success(null);
    } catch (e) {
      // Even if API call fails, clear local storage
      await _storage.clearAll();
      return const Success(null);
    }
  }

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      final userId = await _storage.getUserId();
      final userRole = await _storage.getUserRole();

      if (userId == null || userRole == null) {
        return const Success(null);
      }

      // In a real app, you might fetch user data from API
      // For now, return a basic user object
      final user = User(
        id: userId,
        email: '', // Would need to store this
        name: '', // Would need to store this
        role: userRole,
      );

      return Success(user);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to get current user: ${e.toString()}'));
    }
  }

  @override
  Future<Result<bool>> isAuthenticated() async {
    try {
      final token = await _storage.getToken();
      return Success(token != null);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to check authentication: ${e.toString()}'));
    }
  }
}

