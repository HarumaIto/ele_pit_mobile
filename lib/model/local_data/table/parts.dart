import 'package:drift/drift.dart';

class Parts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get quantity => integer()();
  TextColumn get location => text()();
  TextColumn get imagePath => text().nullable()();
}
