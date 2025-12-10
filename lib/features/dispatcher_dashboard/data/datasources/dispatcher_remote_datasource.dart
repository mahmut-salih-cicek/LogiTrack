import '../../../../core/network/mock_server/mock_datasource.dart';
import '../../../../core/error/app_exception.dart';

abstract class DispatcherRemoteDataSource {
  Future<Map<String, dynamic>> getDashboardStats();
  Future<List<Map<String, dynamic>>> getLiveDrivers();
}

class DispatcherRemoteDataSourceImpl implements DispatcherRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getDashboardStats() async {
    try {
      return await MockDataSource.getDashboardStats();
    } catch (e) {
      throw NetworkException('Failed to fetch dashboard stats', originalError: e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getLiveDrivers() async {
    try {
      return await MockDataSource.getLiveDrivers();
    } catch (e) {
      throw NetworkException('Failed to fetch live drivers', originalError: e);
    }
  }
}

