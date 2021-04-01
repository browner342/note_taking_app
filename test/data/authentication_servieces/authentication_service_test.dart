import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';

class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  String get email => 'test';

  @override
  Future<GoogleSignInAuthentication> get authentication async =>
      MockGoogleSignInAuthentication();
}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {
  @override
  String get accessToken => 'test';

  @override
  String get idToken => 'test';
}

class MockFacebookLogin extends Mock implements FacebookLogin {}

class MockFacebookLoginResult extends Mock implements FacebookLoginResult {
  MockFacebookLoginResult();
  @override
  FacebookAccessToken get accessToken => MockFacebookAccessToken();
}

class MockFacebookAccessToken extends Mock implements FacebookAccessToken {
  @override
  String get token => 'test';
}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final MockGoogleSignIn mockGoogleSignIn = MockGoogleSignIn();
  final MockFacebookLogin mockFacebookLogin = MockFacebookLogin();
  final AuthenticationService authenticationService = AuthenticationService(
    mockFirebaseAuth,
    mockGoogleSignIn,
    mockFacebookLogin,
  );
  setUp(() {});

  test('emit occurs', () async {
    expectLater(
        authenticationService.authStateChanges, emitsInOrder([_mockUser]));
  });

  test('sign up when all correct', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'email', password: 'password'))
        .thenAnswer((realInvocation) => null);

    expect(
        await authenticationService.signUp(
            email: 'email', password: 'password'),
        "Signed Up");
  });

  test('sign up when fail', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'email', password: 'password'))
        .thenAnswer(
            (realInvocation) => throw FirebaseAuthException(message: "fail"));

    expect(
        await authenticationService.signUp(
            email: 'email', password: 'password'),
        "fail");
  });

  test('log in when all correct', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'email', password: 'password'))
        .thenAnswer((realInvocation) => null);

    expect(
        await authenticationService.logIn(email: 'email', password: 'password'),
        "Logged In");
  });

  test('log in when fail', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'email', password: 'password'))
        .thenAnswer(
            (realInvocation) => throw FirebaseAuthException(message: "fail"));

    expect(
        await authenticationService.logIn(email: 'email', password: 'password'),
        "fail");
  });

  test('log out when all correct', () async {
    when(mockFirebaseAuth.signOut()).thenAnswer((realInvocation) => null);

    expect(await authenticationService.logOut(), "Succeeded");
  });

  test('log in when fail', () async {
    when(mockFirebaseAuth.signOut()).thenAnswer(
        (realInvocation) => throw FirebaseAuthException(message: "fail"));

    expect(await authenticationService.logOut(), "fail");
  });

  test('Google sign in all correct', () async {
    when(mockGoogleSignIn.signIn())
        .thenAnswer((realInvocation) async => MockGoogleSignInAccount());

    expect(await authenticationService.signInWithGoogle(), "Logged In");
  });

  test('Google sign in when fail on google authorization should return Fail',
      () async {
    when(await mockGoogleSignIn.signIn()).thenAnswer((realInvocation) => null);

    expect(await authenticationService.signInWithGoogle(), "Fail");
  });

  test('Facebook sign in all correct', () async {
    when(mockFacebookLogin.logIn(['email']))
        .thenAnswer((_) async => MockFacebookLoginResult());

    when(mockFirebaseAuth.signInWithCredential(FacebookAuthProvider.credential(
            MockFacebookLoginResult().accessToken.token)))
        .thenAnswer((realInvocation) => null);

    expect(await authenticationService.signInWithFacebook(), "Logged in");
  });

  test('Facebook sign in when facebook login failed should return ', () async {
    when(mockFacebookLogin.logIn(['email'])).thenAnswer((_) async => null);

    expect(await authenticationService.signInWithFacebook(), "Fail");
  });
}
