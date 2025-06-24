import 'package:ele_pit/model/local_data/model/part.dart';
import 'package:ele_pit/repository/abstract/repository_part.dart';
import 'package:ele_pit/repository/repository_part_local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final partUseCaseProvider = Provider(
  (ref) => PartUseCase(ref.read(partRepositoryProvider)),
);

class PartUseCase {
  final PartRepository repository;
  PartUseCase(this.repository);

  Future<List<Part>> getAllParts() => repository.fetchAllParts();
  Future<int> addPart({
    required String name,
    required int quantity,
    required String location,
    String? imagePath,
  }) {
    return repository.addPart(
      name: name,
      quantity: quantity,
      location: location,
      imagePath: imagePath,
    );
  }

  Future<void> deletePart(int id) => repository.deletePart(id);
}
