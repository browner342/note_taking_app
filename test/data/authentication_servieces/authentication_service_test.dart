import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
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

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final AuthenticationService authenticationService =
      AuthenticationService(mockFirebaseAuth);
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
}
