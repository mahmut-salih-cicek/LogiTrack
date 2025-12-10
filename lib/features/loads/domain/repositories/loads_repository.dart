import '../entities/load.dart';
import '../../../../core/utils/result.dart';

abstract class LoadsRepository {
  Future<Result<List<Load>>> getLoads({String? date, String? status});
  Future<Result<Load>> getLoadDetail(String loadId);
  Future<Result<void>> assignLoadToDriver(String loadId, String driverId);
}

