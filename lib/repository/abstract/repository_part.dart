import 'package:ele_pit/model/local_data/model/part.dart' as model;

abstract class PartRepository {
  Future<List<model.Part>> fetchAllParts();
  Future<int> addPart({
    required String name,
    required int quantity,
    required String location,
    String? imagePath,
  });
  Future<void> deletePart(int id);
}
