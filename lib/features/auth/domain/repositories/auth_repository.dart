import '../entities/user.dart';
import '../../../../core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<User>> login(String email, String password);
  Future<Result<void>> logout();
  Future<Result<User?>> getCurrentUser();
  Future<Result<bool>> isAuthenticated();
}

