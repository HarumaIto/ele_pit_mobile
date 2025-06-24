import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_auth.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _AuthState;
}