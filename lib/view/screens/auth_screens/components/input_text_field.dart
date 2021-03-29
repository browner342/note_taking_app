import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  InputTextField({this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          //Do something with the user input.
        },
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(kBorderRadiusButton)),
          ),
        ),
      ),
    );
  }
}
