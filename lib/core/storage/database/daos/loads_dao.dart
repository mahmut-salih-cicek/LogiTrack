import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/loads_table.dart';

part 'loads_dao.g.dart';

@DriftAccessor(tables: [Loads])
class LoadsDao extends DatabaseAccessor<AppDatabase> with _$LoadsDaoMixin {
  LoadsDao(super.db);

  Future<List<Load>> getAllLoads() => select(loads).get();

  Future<List<Load>> getLoadsByStatus(String status) =>
      (select(loads)..where((l) => l.status.equals(status))).get();

  Future<Load?> getLoadById(String id) =>
      (select(loads)..where((l) => l.id.equals(id))).getSingleOrNull();

  Future<void> insertLoad(LoadsCompanion load) => into(loads).insert(load, mode: InsertMode.replace);

  Future<void> insertLoads(List<LoadsCompanion> loadsList) =>
      batch((batch) => batch.insertAll(loads, loadsList, mode: InsertMode.replace));

  Future<void> updateLoadStatus(String id, String status) =>
      (update(loads)..where((l) => l.id.equals(id))).write(LoadsCompanion(status: Value(status)));

  Future<void> deleteLoad(String id) => (delete(loads)..where((l) => l.id.equals(id))).go();

  Future<void> deleteAllLoads() => delete(loads).go();
}

