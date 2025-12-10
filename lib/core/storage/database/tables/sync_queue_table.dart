import 'package:drift/drift.dart';

class SyncQueue extends Table {
  TextColumn get id => text()();
  TextColumn get endpoint => text()();
  TextColumn get method => text()(); // GET, POST, PUT, DELETE
  TextColumn get payload => text()(); // JSON string
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn? get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn? get lastRetryAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

