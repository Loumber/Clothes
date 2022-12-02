import 'package:drift/drift.dart';

// part 'notes.g.dart';

class Clothes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 4,max: 10)();
  TextColumn get type => text()();
  TextColumn get category => text()();
  TextColumn get description => text().withLength(min: 0,max: 30)();
}