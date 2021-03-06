import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';

class WelcomeButton extends StatelessWidget {
  WelcomeButton({this.onPressed, this.text});
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(kBorderRadiusButton),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
