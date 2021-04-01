import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

abstract class BaseAuth {
  Future<void> logOut();
  Future<String> logIn({String email, String password});
  Future<String> signUp({String email, String password});
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
}

/// Class AuthenticationService
/// Handle authentication with firebase
class AuthenticationService implements BaseAuth {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;
  AuthenticationService(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookLogin,
  );

  /// Create a stream with user state (logged, not logged, etc.)
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Log out user
  /// return String
  /// when success => "Succeeded"
  /// when fail => message
  @override
  Future<String> logOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      await _facebookLogin.logOut();
      return "Succeeded";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  /// Log In user
  /// return String
  /// when success => "Logged In"
  /// when fail => message
  @override
  Future<String> logIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logged In";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  /// Sign Up user
  /// return String
  /// when success => "Signed Up"
  /// when fail => message
  @override
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        await _firebaseAuth.signInWithCredential(credential);

        return "Logged In";
      } on FirebaseAuthException catch (e) {
        print(e.message);
        return e.message;
      }
    }
    return 'Fail';
  }

  @override
  Future<String> signInWithFacebook() async {
    final FacebookLoginResult result = await _facebookLogin.logIn(["email"]);

    try {
      final credential =
          FacebookAuthProvider.credential(result.accessToken.token);
      await _firebaseAuth.signInWithCredential(credential);

      return "Logged in";
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      return e.message;
    } catch (e) {
      // print(e);
      return "Fail";
    }
  }
}
