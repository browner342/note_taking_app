import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';
import 'package:note_taking_app/data_view/date/date_provider.dart';
import 'package:note_taking_app/view/screens/auth_screens/forgot_pass_screen/forgot_pass_screen.dart';
import 'package:note_taking_app/view/screens/auth_screens/login_screen/login_screen.dart';
import 'package:note_taking_app/view/screens/auth_screens/singUp_screen/singUp_screen.dart';
import 'package:note_taking_app/view/screens/edit_note_screen/edit_note_screen.dart';

import 'package:note_taking_app/view/screens/main_screen/main_screen.dart';

import 'package:note_taking_app/view/screens/welcome_screen/welcome_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(
            FirebaseAuth.instance,
            GoogleSignIn(),
            FacebookLogin(),
          ),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
        ChangeNotifierProvider<DateProvider>(
            create: (_) => DateProvider(DateTime.now())),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: AuthenticationWrapper(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ForgotPassScreen.id: (context) => ForgotPassScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        MainScreen.id: (context) => MainScreen(),
        EditNoteScreen.id: (context) => EditNoteScreen(),
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MainScreen();
    }
    return WelcomeScreen();
  }
}
