import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/upload_tasks_table.dart';

part 'upload_tasks_dao.g.dart';

@DriftAccessor(tables: [UploadTasks])
class UploadTasksDao extends DatabaseAccessor<AppDatabase> with _$UploadTasksDaoMixin {
  UploadTasksDao(super.db);

  Future<List<UploadTask>> getAllTasks() => select(uploadTasks).get();

  Future<List<UploadTask>> getPendingTasks() =>
      (select(uploadTasks)..where((t) => t.status.equals('pending'))).get();

  Future<List<UploadTask>> getFailedTasks() =>
      (select(uploadTasks)..where((t) => t.status.equals('failed'))).get();

  Future<UploadTask?> getTaskById(String id) =>
      (select(uploadTasks)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> insertTask(UploadTasksCompanion task) =>
      into(uploadTasks).insert(task, mode: InsertMode.replace);

  Future<void> updateTaskProgress(String id, double progress) =>
      (update(uploadTasks)..where((t) => t.id.equals(id)))
          .write(UploadTasksCompanion(progress: Value(progress)));

  Future<void> updateTaskStatus(String id, String status, {String? errorMessage}) =>
      (update(uploadTasks)..where((t) => t.id.equals(id))).write(
        UploadTasksCompanion(
          status: Value(status),
          errorMessage: errorMessage != null ? Value(errorMessage) : const Value.absent(),
          completedAt: status == 'completed' ? Value(DateTime.now()) : const Value.absent(),
        ),
      );

  Future<void> incrementRetryCount(String id) async {
    final task = await getTaskById(id);
    if (task != null) {
      (update(uploadTasks)..where((t) => t.id.equals(id)))
          .write(UploadTasksCompanion(retryCount: Value(task.retryCount + 1)));
    }
  }

  Future<void> deleteTask(String id) => (delete(uploadTasks)..where((t) => t.id.equals(id))).go();

  Future<void> deleteCompletedTasks() =>
      (delete(uploadTasks)..where((t) => t.status.equals('completed'))).go();
}

