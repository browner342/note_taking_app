import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<void> logOut();
  Future<String> logIn({String email, String password});
  Future<String> signUp({String email, String password});
}

class AuthenticationService implements BaseAuth {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<String> logOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Succeeded";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  Future<String> logIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logged In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
