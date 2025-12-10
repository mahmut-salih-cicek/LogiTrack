import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../../core/storage/database/app_database.dart' as db;
import '../../../../core/utils/result.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/pod_entity.dart';
import '../../domain/repositories/pod_repository.dart';

class PodRepositoryImpl implements PodRepository {
  final db.AppDatabase _database;

  PodRepositoryImpl(this._database);

  @override
  Future<Result<void>> createPod(PodEntity pod) async {
    try {
      await _database.podsDao.insertPod(
        db.PodsCompanion.insert(
          id: pod.id,
          stopId: pod.stopId,
          loadId: pod.loadId,
          receiverName: Value(pod.receiverName),
          signaturePath: Value(pod.signaturePath),
          photos: jsonEncode(pod.photos),
          notes: Value(pod.notes),
          packageScans: jsonEncode(pod.packageScans),
          latitude: pod.latitude,
          longitude: pod.longitude,
          createdAt: pod.createdAt,
          isSynced: const Value(false),
          rawData: jsonEncode({
            'id': pod.id,
            'stopId': pod.stopId,
            'loadId': pod.loadId,
          }),
        ),
      );

      // Add to sync queue
      await _database.syncQueueDao.insertItem(
        db.SyncQueueCompanion.insert(
          id: '${pod.id}_sync',
          endpoint: '/pods',
          method: 'POST',
          payload: jsonEncode({
            'stopId': pod.stopId,
            'loadId': pod.loadId,
            'receiverName': pod.receiverName,
            'photos': pod.photos,
            'packageScans': pod.packageScans,
            'notes': pod.notes,
            'latitude': pod.latitude,
            'longitude': pod.longitude,
          }),
          createdAt: DateTime.now(),
        ),
      );

      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to create POD: ${e.toString()}'));
    }
  }

  @override
  Future<Result<List<PodEntity>>> getPodsByStopId(String stopId) async {
    try {
      final pods = await _database.podsDao.getPodsByStopId(stopId);
      final entities = pods.map((pod) => PodEntity(
        id: pod.id,
        stopId: pod.stopId,
        loadId: pod.loadId,
        receiverName: pod.receiverName,
        signaturePath: pod.signaturePath,
        photos: (jsonDecode(pod.photos) as List).cast<String>(),
        notes: pod.notes,
        packageScans: (jsonDecode(pod.packageScans) as List).cast<String>(),
        latitude: pod.latitude,
        longitude: pod.longitude,
        createdAt: pod.createdAt,
        isSynced: pod.isSynced,
      )).toList();
      return Success(entities);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to get PODs: ${e.toString()}'));
    }
  }

  @override
  Future<Result<List<PodEntity>>> getUnsyncedPods() async {
    try {
      final pods = await _database.podsDao.getUnsyncedPods();
      final entities = pods.map((pod) => PodEntity(
        id: pod.id,
        stopId: pod.stopId,
        loadId: pod.loadId,
        receiverName: pod.receiverName,
        signaturePath: pod.signaturePath,
        photos: (jsonDecode(pod.photos) as List).cast<String>(),
        notes: pod.notes,
        packageScans: (jsonDecode(pod.packageScans) as List).cast<String>(),
        latitude: pod.latitude,
        longitude: pod.longitude,
        createdAt: pod.createdAt,
        isSynced: pod.isSynced,
      )).toList();
      return Success(entities);
    } catch (e) {
      return FailureResult(UnknownFailure('Failed to get unsynced PODs: ${e.toString()}'));
    }
  }
}

