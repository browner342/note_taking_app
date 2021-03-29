import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_text_field.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/styled_button_auth.dart';

class ForgotPassScreen extends StatelessWidget {
  static const String id = kForgotPassScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Your Password?'),
      ),
      body: Column(
        children: [
          Text('Provide email here'),
          InputTextField(
            hintText: 'Email',
          ),
          StyledButtonAuth(
            buttonText: 'Send',
            callbackOnTap: () {
              //TODO:send email
            },
          ),
        ],
      ),
    );
  }
}
