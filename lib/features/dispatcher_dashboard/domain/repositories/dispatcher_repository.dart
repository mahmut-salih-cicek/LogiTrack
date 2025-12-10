import '../entities/dashboard_stats.dart';
import '../../../../core/utils/result.dart';

abstract class DispatcherRepository {
  Future<Result<DashboardStats>> getDashboardStats();
  Future<Result<List<Map<String, dynamic>>>> getLiveDrivers();
}

