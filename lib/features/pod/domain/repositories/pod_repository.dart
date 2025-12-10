import '../../../../core/utils/result.dart';
import '../entities/pod_entity.dart';

abstract class PodRepository {
  Future<Result<void>> createPod(PodEntity pod);
  Future<Result<List<PodEntity>>> getPodsByStopId(String stopId);
  Future<Result<List<PodEntity>>> getUnsyncedPods();
}

