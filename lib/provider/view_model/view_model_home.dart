import 'package:ele_pit/model/view_model/state_home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model_home.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    return const HomeState();
  }
}
