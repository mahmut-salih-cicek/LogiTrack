import 'package:drift/drift.dart';

class Stops extends Table {
  TextColumn get id => text()();
  TextColumn get loadId => text()();
  TextColumn get type => text()(); // pickup or delivery
  TextColumn get address => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get geofenceRadius => real()();
  TextColumn get status => text()(); // pending, in_progress, completed
  DateTimeColumn? get expectedArrival => dateTime().nullable()();
  DateTimeColumn? get actualArrival => dateTime().nullable()();
  DateTimeColumn? get actualDeparture => dateTime().nullable()();
  TextColumn? get notes => text().nullable()(); // Special notes for the stop
  TextColumn get rawData => text()(); // JSON string for full stop data

  @override
  Set<Column> get primaryKey => {id};
}

