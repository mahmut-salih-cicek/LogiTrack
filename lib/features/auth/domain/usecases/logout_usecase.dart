import '../repositories/auth_repository.dart';
import '../../../../core/utils/result.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<Result<void>> call() async {
    return await _repository.logout();
  }
}

