import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/components/input_form.dart';

class LoginScreen extends StatelessWidget {
  static const String id = kLoginScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
