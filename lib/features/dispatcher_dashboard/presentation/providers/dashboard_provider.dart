import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../data/repositories/dispatcher_repository_impl.dart';
import '../../data/datasources/dispatcher_remote_datasource.dart';
import '../../../../core/utils/result.dart';

final dispatcherRemoteDataSourceProvider = Provider<DispatcherRemoteDataSource>((ref) {
  return DispatcherRemoteDataSourceImpl();
});

final dispatcherRepositoryProvider = Provider<DispatcherRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(dispatcherRemoteDataSourceProvider);
  return DispatcherRepositoryImpl(remoteDataSource);
});

class DashboardNotifier extends StateNotifier<AsyncValue<DashboardStats>> {
  final DispatcherRepositoryImpl _repository;

  DashboardNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadStats();
  }

  Future<void> loadStats() async {
    state = const AsyncValue.loading();
    final result = await _repository.getDashboardStats();
    if (result.isSuccess) {
      state = AsyncValue.data(result.dataOrNull!);
    } else {
      state = AsyncValue.error(result.failureOrNull!, StackTrace.current);
    }
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardStats>>((ref) {
  final repository = ref.watch(dispatcherRepositoryProvider);
  return DashboardNotifier(repository);
});

