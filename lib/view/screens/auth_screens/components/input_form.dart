import 'package:flutter/material.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_text_field.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/styled_button_auth.dart';
import 'package:provider/provider.dart';

class InputForm extends StatelessWidget {
  final String buttonText;
  final AuthType authType;
  final progress;
  InputForm({this.buttonText, this.authType, this.progress});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context, listen: false);
    final authState = Provider.of<AuthenticationService>(context);
    String message;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadiusButton)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(3.0, 3.0),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          children: [
            InputTextField(
              hintText: 'Email',
              controller: emailController,
              isPassword: false,
            ),
            InputTextField(
              hintText: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StyledButtonAuth(
                    key: Key(buttonText),
                    buttonText: buttonText,
                    callbackOnTap: () async {
                      progress?.show();

                      //Check what type of auth and do login or sinUp
                      authType == AuthType.LogIn
                          ? message = await auth.logIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            )
                          : message = await auth.signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                      if (authState.authStateChanges != null) {
                        Navigator.pop(context);
                      }
                      progress?.dismiss();

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
            )
          ],
        ),
      ),
    );
  }
}
