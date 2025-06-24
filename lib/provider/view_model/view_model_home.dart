import 'package:ele_pit/model/view_model/state_home.dart';
import 'package:ele_pit/provider/use_case/part_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model_home.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeState> build() async {
    final partUseCase = ref.watch(partUseCaseProvider);
    final parts = await partUseCase.getAllParts();
    return HomeState(parts: parts);
  }
}
