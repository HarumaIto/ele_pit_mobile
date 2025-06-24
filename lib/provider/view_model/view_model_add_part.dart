import 'package:ele_pit/provider/use_case/part_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model_add_part.g.dart';

@riverpod
class AddPartViewModel extends _$AddPartViewModel {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> savePart({
    required String name,
    required int quantity,
    required String location,
    String? imagePath,
  }) async {
    state = const AsyncValue.loading();
    try {
      final useCase = ref.read(partUseCaseProvider);
      await useCase.addPart(
        name: name,
        quantity: quantity,
        location: location,
        imagePath: imagePath,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
