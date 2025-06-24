import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:ele_pit/model/local_data/table/parts.dart';
import 'package:ele_pit/model/local_data/model/part.dart' as model;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Parts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertPart(PartsCompanion part) => into(parts).insert(part);
  Future<List<model.Part>> getAllParts() => select(parts).get().then(
        (rows) => rows
            .map((row) => model.Part(
                  id: row.id,
                  name: row.name,
                  quantity: row.quantity,
                  location: row.location,
                  imagePath: row.imagePath,
                ))
            .toList(),
      );
  Future deletePart(int id) =>
      (delete(parts)..where((tbl) => tbl.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
