import 'package:drift/drift.dart';

class Pods extends Table {
  TextColumn get id => text()();
  TextColumn get stopId => text()();
  TextColumn get loadId => text()();
  TextColumn? get receiverName => text().nullable()();
  TextColumn? get signaturePath => text().nullable()();
  TextColumn get photos => text()(); // JSON array of photo paths
  TextColumn? get notes => text().nullable()();
  TextColumn get packageScans => text()(); // JSON array of scanned packages
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get rawData => text()(); // JSON string for full POD data

  @override
  Set<Column> get primaryKey => {id};
}

