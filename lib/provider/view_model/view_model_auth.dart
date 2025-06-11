import 'package:ele_pit/model/view_model/state_auth.dart';
import 'package:ele_pit/repository/repository_google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model_auth.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late final GoogleSignInRepository _googleSignInRepository;

  @override
  AuthState build() {
    _googleSignInRepository = GoogleSignInRepository(
      googleSignIn: GoogleSignIn(),
      firebaseAuth: FirebaseAuth.instance,
    );

    return const AuthState();
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true);
    try {
      await _googleSignInRepository.signIn();
      state = state.copyWith(isLoading: false, error: '');
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Google認証に失敗しました: $e');
    }
  }
}
