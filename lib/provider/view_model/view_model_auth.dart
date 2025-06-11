import 'package:ele_pit/model/view_model/state_auth.dart';
import 'package:ele_pit/provider/global/provider_firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model_auth.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() {
    return const AuthState();
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true);
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        state = state.copyWith(isLoading: false, error: 'Google認証がキャンセルされました');
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final instance = ref.read(firebaseAuthProvider);
      await instance.signInWithCredential(credential);
      state = state.copyWith(isLoading: false, error: '');  
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Google認証に失敗しました: $e');
    }
  }
}