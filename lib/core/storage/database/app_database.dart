import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables/loads_table.dart';
import 'tables/stops_table.dart';
import 'tables/pods_table.dart';
import 'tables/incidents_table.dart';
import 'tables/upload_tasks_table.dart';
import 'tables/sync_queue_table.dart';
import 'tables/location_pings_table.dart';
import 'daos/loads_dao.dart';
import 'daos/stops_dao.dart';
import 'daos/pods_dao.dart';
import 'daos/incidents_dao.dart';
import 'daos/upload_tasks_dao.dart';
import 'daos/sync_queue_dao.dart';
import 'daos/location_pings_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Loads,
    Stops,
    Pods,
    Incidents,
    UploadTasks,
    SyncQueue,
    LocationPings,
  ],
  daos: [
    LoadsDao,
    StopsDao,
    PodsDao,
    IncidentsDao,
    UploadTasksDao,
    SyncQueueDao,
    LocationPingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations here
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'turusa_db.sqlite'));
    return NativeDatabase(file);
  });
}

