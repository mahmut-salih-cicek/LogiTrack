// import 'package:flutter_test/flutter_test.dart';
// import 'package:lojistik_application/core/offline_sync/sync_engine.dart';
// import 'package:lojistik_application/core/network/dio_client.dart';
// import 'package:lojistik_application/core/storage/database/app_database.dart';
// import 'package:lojistik_application/core/storage/secure_storage_service.dart';
// import 'package:lojistik_application/core/offline_sync/sync_queue_repository.dart';

// void main() {
//   test('Sync engine initializes correctly', () {
//     final storage = SecureStorageService();
//     final dioClient = DioClient(storage);
//     final database = AppDatabase();
//     final syncQueueRepository = SyncQueueRepository(database);
//     final syncEngine = SyncEngine(dioClient, syncQueueRepository, database);

//     expect(syncEngine, isNotNull);
//     expect(syncEngine.isSyncing, false);
//   });
// }

