import 'package:ele_pit/model/local_data/model/part.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_home.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Part> parts,
  }) = _HomeState;
}
