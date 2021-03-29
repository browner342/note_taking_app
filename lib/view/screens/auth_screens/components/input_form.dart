import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/input_text_field.dart';
import 'package:note_taking_app/view/screens/auth_screens/components/styled_button_auth.dart';
import 'package:note_taking_app/view/screens/main_screen/main_screen.dart';

class InputForm extends StatelessWidget {
  final String buttonText;
  InputForm({this.buttonText});

  @override
  Widget build(BuildContext context) {
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
            ),
            InputTextField(
              hintText: 'Password',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StyledButtonAuth(
                    buttonText: buttonText,
                    callbackOnTap: () {
                      Navigator.of(context).pushNamed(MainScreen.id);
                      //  TODO: Authorization
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
