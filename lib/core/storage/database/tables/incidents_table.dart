import 'package:drift/drift.dart';

class Incidents extends Table {
  TextColumn get id => text()();
  TextColumn get loadId => text()();
  TextColumn get type => text()(); // delay, damage, missing, refused
  TextColumn get description => text()();
  TextColumn get photos => text()(); // JSON array of photo paths
  TextColumn? get voiceNotePath => text().nullable()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isResolved => boolean().withDefault(const Constant(false))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get rawData => text()(); // JSON string for full incident data

  @override
  Set<Column> get primaryKey => {id};
}

