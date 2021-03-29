import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  WelcomeButton({this.onPressed, this.text});
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
