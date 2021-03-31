import 'package:flutter/material.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/google_button.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_form.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = kSingUpScreenId;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context, listen: false);
    final authState = Provider.of<AuthenticationService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              kIconLogo,
              size: 200,
            ),
            InputForm(
              buttonText: 'Sign Up',
              authType: AuthType.SignUp,
            ),
            GoogleButton(auth: auth, authState: authState)
          ],
        ),
      ),
    );
  }
}
