import '../entities/route_stop.dart';
import '../../../../core/utils/result.dart';

abstract class RouteRepository {
  Future<Result<List<RouteStop>>> getTodayRoute();
  Future<Result<void>> arriveAtStop(String stopId);
  Future<Result<void>> departFromStop(String stopId);
}

