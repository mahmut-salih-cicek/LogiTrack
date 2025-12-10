import 'package:drift/drift.dart';

class UploadTasks extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()(); // pod, incident, document
  TextColumn get entityId => text()(); // ID of the entity being uploaded
  TextColumn get filePath => text()();
  TextColumn get endpoint => text()();
  TextColumn get status => text()(); // pending, uploading, completed, failed
  RealColumn get progress => real().withDefault(const Constant(0.0))();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn? get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn? get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

