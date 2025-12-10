import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/location_pings_table.dart';

part 'location_pings_dao.g.dart';

@DriftAccessor(tables: [LocationPings])
class LocationPingsDao extends DatabaseAccessor<AppDatabase> with _$LocationPingsDaoMixin {
  LocationPingsDao(super.db);

  Future<List<LocationPing>> getAllPings() => select(locationPings).get();

  Future<List<LocationPing>> getUnsyncedPings() =>
      (select(locationPings)..where((p) => p.isSynced.equals(false))).get();

  Future<void> insertPing(LocationPingsCompanion ping) =>
      into(locationPings).insert(ping, mode: InsertMode.replace);

  Future<void> markPingAsSynced(String id) =>
      (update(locationPings)..where((p) => p.id.equals(id))).write(LocationPingsCompanion(isSynced: Value(true)));

  Future<void> deleteOldPings(DateTime beforeDate) =>
      (delete(locationPings)..where((p) => p.timestamp.isSmallerThanValue(beforeDate))).go();

  Future<void> deleteAllPings() => delete(locationPings).go();
}

