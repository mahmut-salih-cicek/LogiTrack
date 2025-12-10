import '../repositories/loads_repository.dart';
import '../../../../core/utils/result.dart';

class AssignLoadToDriverUseCase {
  final LoadsRepository _repository;

  AssignLoadToDriverUseCase(this._repository);

  Future<Result<void>> call(String loadId, String driverId) async {
    return await _repository.assignLoadToDriver(loadId, driverId);
  }
}

