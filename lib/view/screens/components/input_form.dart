import 'package:flutter/material.dart';
import 'package:note_taking_app/view/screens/components/input_text_field.dart';

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
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                  ElevatedButton(
                    onPressed: () {
                      //  TODO
                    },
                    child: Text(buttonText),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
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
