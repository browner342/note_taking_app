import 'package:flutter/material.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key key,
    @required this.auth,
    @required this.authState,
    this.progress,
  }) : super(key: key);

  final AuthenticationService auth;
  final AuthenticationService authState;
  final progress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          progress?.show();
          await auth.signInWithGoogle();
          if (authState.authStateChanges != null) {
            Navigator.pop(context);
          }
          progress?.dismiss();
        },
        child: Text('Sign with google'));
  }
}
