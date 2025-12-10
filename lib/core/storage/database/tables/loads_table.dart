import 'package:drift/drift.dart';

class Loads extends Table {
  TextColumn get id => text()();
  TextColumn get loadNumber => text()();
  TextColumn get status => text()();
  TextColumn? get assignedDriverId => text().nullable()();
  TextColumn? get assignedDriverName => text().nullable()();
  TextColumn get pickupAddress => text()();
  TextColumn get deliveryAddress => text()();
  DateTimeColumn get pickupDate => dateTime()();
  DateTimeColumn get deliveryDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get rawData => text()(); // JSON string for full load data

  @override
  Set<Column> get primaryKey => {id};
}

