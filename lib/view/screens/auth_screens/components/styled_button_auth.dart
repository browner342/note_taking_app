import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';

class StyledButtonAuth extends StatelessWidget {
  StyledButtonAuth({this.buttonText, this.callbackOnTap});
  final String buttonText;
  final Function callbackOnTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callbackOnTap,
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(kBorderRadiusButton),
        ),
      ),
    );
  }
}
