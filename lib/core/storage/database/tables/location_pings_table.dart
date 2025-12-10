import 'package:drift/drift.dart';

class LocationPings extends Table {
  TextColumn get id => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn? get accuracy => real().nullable()();
  RealColumn? get speed => real().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

