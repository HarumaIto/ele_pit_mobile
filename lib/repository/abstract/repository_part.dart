import 'package:ele_pit/model/local_data/app_database.dart';
import 'package:ele_pit/model/local_data/model/part.dart' as model;

abstract class PartRepository {
  Future<List<model.Part>> fetchAllParts();
  Future<int> addPart(PartsCompanion part);
  Future<void> deletePart(int id);
}
