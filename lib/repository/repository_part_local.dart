import 'package:drift/drift.dart';
import 'package:ele_pit/model/local_data/app_database.dart';
import 'package:ele_pit/provider/global/provider_app_database.dart';
import 'package:ele_pit/model/local_data/model/part.dart' as model;
import 'package:ele_pit/repository/abstract/repository_part.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final partRepositoryProvider = Provider<PartRepository>(
  (ref) => LocalPartRepository(ref.read(appDatabaseProvider)),
);

class LocalPartRepository implements PartRepository {
  final AppDatabase db;
  LocalPartRepository(this.db);

  @override
  Future<List<model.Part>> fetchAllParts() => db.getAllParts();

  @override
  Future<int> addPart({
    required String name,
    required int quantity,
    required String location,
    String? imagePath,
  }) {
    final part = PartsCompanion(
      name: Value(name),
      quantity: Value(quantity),
      location: Value(location),
      imagePath: Value(imagePath),
    );
    return db.insertPart(part);
  }

  @override
  Future<void> deletePart(int id) => db.deletePart(id);
}
