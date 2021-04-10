import 'package:flutter/material.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_text_field.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/styled_button_auth.dart';
import 'package:note_taking_app/view/screens/welcome_screen/welcome_screen.dart';
import 'package:provider/provider.dart';

class ForgotPassScreen extends StatelessWidget {
  static const String id = kForgotPassScreenId;
  TextEditingController emailController = TextEditingController();
  String message;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Your Password?'),
      ),
      body: Column(
        children: [
          InputTextField(
            hintText: 'Email',
            controller: emailController,
            isPassword: false,
          ),
          StyledButtonAuth(
            buttonText: 'Send',
            callbackOnTap: () async {
              message = await auth.resetPassword(emailController.text.trim());
              Navigator.pop(context);

              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Alert Dialog title"),
                      content: new Text(message),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
