import '../entities/load.dart';
import '../repositories/loads_repository.dart';
import '../../../../core/utils/result.dart';

class GetLoadsUseCase {
  final LoadsRepository _repository;

  GetLoadsUseCase(this._repository);

  Future<Result<List<Load>>> call({String? date, String? status}) async {
    return await _repository.getLoads(date: date, status: status);
  }
}

