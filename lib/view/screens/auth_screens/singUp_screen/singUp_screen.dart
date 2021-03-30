import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_form.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = kSingUpScreenId;

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
