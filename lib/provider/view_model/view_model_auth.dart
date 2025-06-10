import 'package:ele_pit/model/view_model/state_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model_auth.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  Future<AuthState> build() async {
    return const AuthState();
  }

  Future<void> toggleLogin() async {
    state = AsyncValue.data(state.value!.copyWith(
      isLogin: !state.value!.isLogin,
      error: '',
    ));
  }

  Future<void> handleButtonPressed(
    String email,
    String password,
  ) async {
    if (state.value!.isLogin) {
      await signIn(email, password);
    } else {
      await signUp(email, password);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      // Implement sign-in logic here
      // For example, using Firebase Auth:
      // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      state = AsyncValue.data(state.value!.copyWith(error: ''));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      // Implement sign-up logic here
      // For example, using Firebase Auth:
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      state = AsyncValue.data(state.value!.copyWith(error: ''));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}