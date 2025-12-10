import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/route_repository.dart';
import '../../data/repositories/route_repository_impl.dart';
import '../../../loads/data/repositories/loads_repository_impl.dart';
import '../../../loads/data/datasources/loads_remote_datasource.dart';
import '../../../../core/utils/result.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../domain/entities/route_stop.dart';

final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  final remoteDataSource = LoadsRemoteDataSourceImpl(ref.watch(dioClientProvider).instance);
  final database = ref.watch(databaseProvider);
  final loadsRepository = LoadsRepositoryImpl(remoteDataSource, database);
  return RouteRepositoryImpl(loadsRepository, database);
});

class RouteNotifier extends StateNotifier<AsyncValue<List<RouteStop>>> {
  final RouteRepository _repository;

  RouteNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadRoute();
  }

  Future<void> loadRoute() async {
    state = const AsyncValue.loading();
    final result = await _repository.getTodayRoute();
    if (result.isSuccess) {
      state = AsyncValue.data(result.dataOrNull ?? []);
    } else {
      state = AsyncValue.error(result.failureOrNull!, StackTrace.current);
    }
  }

  Future<void> arriveAtStop(String stopId) async {
    final result = await _repository.arriveAtStop(stopId);
    if (result.isSuccess) {
      // Reload route to update status
      await loadRoute();
    }
  }

  Future<void> departFromStop(String stopId) async {
    final result = await _repository.departFromStop(stopId);
    if (result.isSuccess) {
      // Reload route to update status
      await loadRoute();
    }
  }
}

final routeProvider = StateNotifierProvider<RouteNotifier, AsyncValue<List<RouteStop>>>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return RouteNotifier(repository);
});

