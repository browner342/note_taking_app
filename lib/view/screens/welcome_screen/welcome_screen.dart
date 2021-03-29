import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/login_screen/login_screen.dart';
import 'package:note_taking_app/view/screens/auth_screens/singUp_screen/singUp_screen.dart';

import 'package:note_taking_app/view/screens/welcome_screen/components/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = kWelcomeScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              kIconLogo,
              size: 200,
            ),
            WelcomeButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'Log In',
            ),
            WelcomeButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
              text: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
