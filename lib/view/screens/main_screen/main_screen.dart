import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/main_screen/components/side_drawer.dart';

class MainScreen extends StatelessWidget {
  static const String id = kMainScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(kBorderRadiusButton)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
