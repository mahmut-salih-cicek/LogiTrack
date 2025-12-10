import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/incidents_table.dart';

part 'incidents_dao.g.dart';

@DriftAccessor(tables: [Incidents])
class IncidentsDao extends DatabaseAccessor<AppDatabase> with _$IncidentsDaoMixin {
  IncidentsDao(super.db);

  Future<List<Incident>> getAllIncidents() => select(incidents).get();

  Future<List<Incident>> getIncidentsByLoadId(String loadId) =>
      (select(incidents)..where((i) => i.loadId.equals(loadId))).get();

  Future<List<Incident>> getUnresolvedIncidents() =>
      (select(incidents)..where((i) => i.isResolved.equals(false))).get();

  Future<List<Incident>> getUnsyncedIncidents() =>
      (select(incidents)..where((i) => i.isSynced.equals(false))).get();

  Future<Incident?> getIncidentById(String id) =>
      (select(incidents)..where((i) => i.id.equals(id))).getSingleOrNull();

  Future<void> insertIncident(IncidentsCompanion incident) =>
      into(incidents).insert(incident, mode: InsertMode.replace);

  Future<void> markIncidentAsResolved(String id) =>
      (update(incidents)..where((i) => i.id.equals(id))).write(IncidentsCompanion(isResolved: Value(true)));

  Future<void> markIncidentAsSynced(String id) =>
      (update(incidents)..where((i) => i.id.equals(id))).write(IncidentsCompanion(isSynced: Value(true)));

  Future<void> deleteIncident(String id) => (delete(incidents)..where((i) => i.id.equals(id))).go();
}

