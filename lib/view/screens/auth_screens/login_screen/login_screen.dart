import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_form.dart';
import 'package:note_taking_app/view/screens/auth_screens/forgot_pass_screen/forgot_pass_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = kLoginScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
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
              buttonText: 'Log In',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ForgotPassScreen.id);
              },
              child: Text('Forgot your password?'),
            ),
          ],
        ),
      ),
    );
  }
}