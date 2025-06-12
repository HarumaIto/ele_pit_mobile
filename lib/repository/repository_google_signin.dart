import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInRepository {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  GoogleSignInRepository({
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  Future<void> signIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google認証がキャンセルされました');
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
  }
}
