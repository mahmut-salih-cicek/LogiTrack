import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/stops_table.dart';

part 'stops_dao.g.dart';

@DriftAccessor(tables: [Stops])
class StopsDao extends DatabaseAccessor<AppDatabase> with _$StopsDaoMixin {
  StopsDao(super.db);

  Future<List<Stop>> getAllStops() => select(stops).get();

  Future<List<Stop>> getStopsByLoadId(String loadId) =>
      (select(stops)..where((s) => s.loadId.equals(loadId))).get();

  Future<Stop?> getStopById(String id) =>
      (select(stops)..where((s) => s.id.equals(id))).getSingleOrNull();

  Future<void> insertStop(StopsCompanion stop) => into(stops).insert(stop, mode: InsertMode.replace);

  Future<void> insertStops(List<StopsCompanion> stopsList) =>
      batch((batch) => batch.insertAll(stops, stopsList, mode: InsertMode.replace));

  Future<void> updateStopStatus(String id, String status) =>
      (update(stops)..where((s) => s.id.equals(id))).write(StopsCompanion(status: Value(status)));

  Future<void> deleteStop(String id) => (delete(stops)..where((s) => s.id.equals(id))).go();
  
  Future<void> deleteAllStops() => delete(stops).go();
}

