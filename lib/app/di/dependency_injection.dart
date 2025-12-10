import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_client.dart';
import '../../core/storage/secure_storage_service.dart';
import '../../core/storage/database/app_database.dart';
import '../../core/offline_sync/sync_queue_repository.dart';
import '../../core/offline_sync/sync_engine.dart';
import '../../features/pod/domain/repositories/pod_repository.dart';
import '../../features/pod/data/repositories/pod_repository_impl.dart';

// Core Services
final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return DioClient(storage);
});

// Sync Services
final syncQueueRepositoryProvider = Provider<SyncQueueRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return SyncQueueRepository(database);
});

final syncEngineProvider = Provider<SyncEngine>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  final syncQueueRepository = ref.watch(syncQueueRepositoryProvider);
  return SyncEngine(dioClient, syncQueueRepository);
});

// POD Repository
final podRepositoryProvider = Provider<PodRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return PodRepositoryImpl(database);
});

