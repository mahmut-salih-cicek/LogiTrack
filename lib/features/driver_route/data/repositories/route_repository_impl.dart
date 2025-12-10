import '../../domain/entities/route_stop.dart';
import '../../domain/repositories/route_repository.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/error/failures.dart';
import '../../../loads/data/repositories/loads_repository_impl.dart';
import '../../../../core/storage/database/app_database.dart';

class RouteRepositoryImpl implements RouteRepository {
  final LoadsRepositoryImpl _loadsRepository;
  final AppDatabase _database;

  RouteRepositoryImpl(this._loadsRepository, this._database);

  @override
  Future<Result<List<RouteStop>>> getTodayRoute() async {
    try {
      final loadsResult = await _loadsRepository.getLoads();
      if (loadsResult.isFailure) {
        return FailureResult(loadsResult.failureOrNull!);
      }

      final loads = loadsResult.dataOrNull ?? [];
      final stops = <RouteStop>[];

      for (final load in loads) {
        for (final stop in load.stops) {
          stops.add(RouteStop(
            id: stop.id,
            loadId: stop.loadId,
            loadNumber: load.loadNumber,
            type: stop.type,
            address: stop.address,
            latitude: stop.latitude,
            longitude: stop.longitude,
            geofenceRadius: stop.geofenceRadius,
            status: stop.status,
            expectedArrival: stop.expectedArrival,
            actualArrival: stop.actualArrival,
            actualDeparture: stop.actualDeparture,
            notes: stop.notes,
          ));
        }
      }

      return Success(stops);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to get route: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void>> arriveAtStop(String stopId) async {
    // Update stop status in database
    try {
      await _database.stopsDao.updateStopStatus(stopId, 'in_progress');
      // TODO: Add to sync queue for remote update
      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to arrive: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void>> departFromStop(String stopId) async {
    // Update stop status
    try {
      await _database.stopsDao.updateStopStatus(stopId, 'completed');
      // TODO: Add to sync queue for remote update
      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to depart: ${e.toString()}'));
    }
  }
}

