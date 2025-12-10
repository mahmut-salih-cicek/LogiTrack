import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/error/failures.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Result<User>> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return FailureResult(const AuthFailure('Email ve şifre gereklidir'));
    }

    return await _repository.login(email, password);
  }
}

