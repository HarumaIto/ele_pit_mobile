import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ele_pit/repository/repository_google_signin.dart';

import 'repository_google_signin_test.mocks.dart';

@GenerateMocks([
  GoogleSignIn,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
])
void main() {
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuth;
  late MockFirebaseAuth mockFirebaseAuth;
  late GoogleSignInRepository repository;

  setUp(() {
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuth = MockGoogleSignInAuthentication();
    mockFirebaseAuth = MockFirebaseAuth();
    repository = GoogleSignInRepository(
      googleSignIn: mockGoogleSignIn,
      firebaseAuth: mockFirebaseAuth,
    );
  });

  test('Googleサインイン成功時にFirebase認証が呼ばれる', () async {
    when(mockGoogleSignIn.signIn())
        .thenAnswer((_) async => mockGoogleSignInAccount);
    when(mockGoogleSignInAccount.authentication)
        .thenAnswer((_) async => mockGoogleSignInAuth);
    when(mockGoogleSignInAuth.accessToken).thenReturn('dummy_access_token');
    when(mockGoogleSignInAuth.idToken).thenReturn('dummy_id_token');

    await repository.signIn();

    verify(mockGoogleSignIn.signIn()).called(1);
  });

  test('Googleサインインがキャンセルされた場合は例外を投げる', () async {
    when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

    expect(
      () async => await repository.signIn(),
      throwsA(isA<Exception>()),
    );
  });

  test('Google認証で例外が発生した場合は例外を投げる', () async {
    when(mockGoogleSignIn.signIn()).thenThrow(Exception('signIn error'));

    expect(
      () async => await repository.signIn(),
      throwsA(isA<Exception>()),
    );
  });
}
