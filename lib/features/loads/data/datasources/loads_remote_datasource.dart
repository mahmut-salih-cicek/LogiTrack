import 'package:dio/dio.dart';
import '../../../../core/network/mock_server/mock_datasource.dart';
import '../../../../core/error/app_exception.dart';

abstract class LoadsRemoteDataSource {
  Future<List<Map<String, dynamic>>> getLoads({String? date, String? status});
  Future<Map<String, dynamic>> getLoadDetail(String loadId);
  Future<Map<String, dynamic>> assignLoadToDriver(String loadId, String driverId);
}

class LoadsRemoteDataSourceImpl implements LoadsRemoteDataSource {
  LoadsRemoteDataSourceImpl(Dio dio);

  @override
  Future<List<Map<String, dynamic>>> getLoads({String? date, String? status}) async {
    try {
      return await MockDataSource.getLoads(date: date, status: status);
    } catch (e) {
      throw NetworkException('Failed to fetch loads', originalError: e);
    }
  }

  @override
  Future<Map<String, dynamic>> getLoadDetail(String loadId) async {
    try {
      return await MockDataSource.getLoadDetail(loadId);
    } catch (e) {
      throw NetworkException('Failed to fetch load detail', originalError: e);
    }
  }

  @override
  Future<Map<String, dynamic>> assignLoadToDriver(String loadId, String driverId) async {
    try {
      return await MockDataSource.assignLoadToDriver(loadId, driverId);
    } catch (e) {
      throw NetworkException('Failed to assign load', originalError: e);
    }
  }
}

