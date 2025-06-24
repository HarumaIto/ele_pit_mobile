import 'package:ele_pit/model/local_data/app_database.dart';
import 'package:ele_pit/model/local_data/model/part.dart' as model;
import 'package:ele_pit/repository/abstract/repository_part.dart';
import 'package:ele_pit/repository/repository_part_local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final partUseCaseProvider = Provider(
  (ref) => PartUseCase(ref.read(partRepositoryProvider)),
);

class PartUseCase {
  final PartRepository repository;
  PartUseCase(this.repository);

  Future<List<model.Part>> getAllParts() => repository.fetchAllParts();
  Future<int> addPart(PartsCompanion part) => repository.addPart(part);
  Future<void> deletePart(int id) => repository.deletePart(id);
}
