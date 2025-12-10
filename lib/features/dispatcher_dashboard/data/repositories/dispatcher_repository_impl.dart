import '../../domain/entities/dashboard_stats.dart';
import '../../domain/repositories/dispatcher_repository.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/app_exception.dart';
import '../datasources/dispatcher_remote_datasource.dart';
import '../models/dashboard_stats_dto.dart';

class DispatcherRepositoryImpl implements DispatcherRepository {
  final DispatcherRemoteDataSource _remoteDataSource;

  DispatcherRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<DashboardStats>> getDashboardStats() async {
    try {
      final data = await _remoteDataSource.getDashboardStats();
      final dto = DashboardStatsDto.fromJson(data);
      return Success(dto.toEntity());
    } on AppException catch (e) {
      return FailureResult(NetworkFailure(e.message));
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to fetch stats: ${e.toString()}'));
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>>> getLiveDrivers() async {
    try {
      final drivers = await _remoteDataSource.getLiveDrivers();
      return Success(drivers);
    } on AppException catch (e) {
      return FailureResult(NetworkFailure(e.message));
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to fetch drivers: ${e.toString()}'));
    }
  }
}

