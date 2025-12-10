import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../storage/database/app_database.dart';
import '../utils/logger.dart';

class SyncQueueRepository {
  final AppDatabase _database;
  final _uuid = const Uuid();

  SyncQueueRepository(this._database);

  /// Add item to sync queue
  Future<void> addToQueue({
    required String endpoint,
    required String method,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final item = SyncQueueCompanion.insert(
        id: _uuid.v4(),
        endpoint: endpoint,
        method: method,
        payload: jsonEncode(payload), // Convert to JSON string
        createdAt: DateTime.now(),
      );

      await _database.syncQueueDao.insertItem(item);
      AppLogger.debug('Added item to sync queue: $endpoint $method');
    } catch (e, stackTrace) {
      AppLogger.error('Failed to add item to sync queue', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Get all pending items
  Future<List<SyncQueueData>> getPendingItems() async {
    try {
      return await _database.syncQueueDao.getPendingItems();
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get pending items', error: e, stackTrace: stackTrace);
      return [];
    }
  }

  /// Remove item from queue
  Future<void> removeFromQueue(String id) async {
    try {
      await _database.syncQueueDao.deleteItem(id);
      AppLogger.debug('Removed item from sync queue: $id');
    } catch (e, stackTrace) {
      AppLogger.error('Failed to remove item from sync queue', error: e, stackTrace: stackTrace);
    }
  }

  /// Increment retry count
  Future<void> incrementRetryCount(String id) async {
    try {
      await _database.syncQueueDao.incrementRetryCount(id);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to increment retry count', error: e, stackTrace: stackTrace);
    }
  }

  /// Update last error
  Future<void> updateLastError(String id, String error) async {
    try {
      await _database.syncQueueDao.updateLastError(id, error);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update last error', error: e, stackTrace: stackTrace);
    }
  }

  /// Clear all items
  Future<void> clearAll() async {
    try {
      await _database.syncQueueDao.deleteAllItems();
      AppLogger.debug('Cleared sync queue');
    } catch (e, stackTrace) {
      AppLogger.error('Failed to clear sync queue', error: e, stackTrace: stackTrace);
    }
  }
}

