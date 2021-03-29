import 'package:flutter/material.dart';
import 'package:note_taking_app/view/screens/login_screen/login_screen.dart';
import 'package:note_taking_app/view/screens/main_screen/main_screen.dart';
import 'package:note_taking_app/view/screens/singUp_screen/singUp_screen.dart';
import 'package:note_taking_app/view/screens/welcome_screen/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}
