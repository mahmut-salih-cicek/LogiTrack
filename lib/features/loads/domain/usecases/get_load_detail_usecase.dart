import '../entities/load.dart';
import '../repositories/loads_repository.dart';
import '../../../../core/utils/result.dart';

class GetLoadDetailUseCase {
  final LoadsRepository _repository;

  GetLoadDetailUseCase(this._repository);

  Future<Result<Load>> call(String loadId) async {
    return await _repository.getLoadDetail(loadId);
  }
}

