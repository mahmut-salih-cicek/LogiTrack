import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/pods_table.dart';

part 'pods_dao.g.dart';

@DriftAccessor(tables: [Pods])
class PodsDao extends DatabaseAccessor<AppDatabase> with _$PodsDaoMixin {
  PodsDao(super.db);

  Future<List<Pod>> getAllPods() => select(pods).get();

  Future<List<Pod>> getPodsByStopId(String stopId) =>
      (select(pods)..where((p) => p.stopId.equals(stopId))).get();

  Future<List<Pod>> getUnsyncedPods() =>
      (select(pods)..where((p) => p.isSynced.equals(false))).get();

  Future<Pod?> getPodById(String id) =>
      (select(pods)..where((p) => p.id.equals(id))).getSingleOrNull();

  Future<void> insertPod(PodsCompanion pod) => into(pods).insert(pod, mode: InsertMode.replace);

  Future<void> markPodAsSynced(String id) =>
      (update(pods)..where((p) => p.id.equals(id))).write(PodsCompanion(isSynced: Value(true)));

  Future<void> deletePod(String id) => (delete(pods)..where((p) => p.id.equals(id))).go();
}

