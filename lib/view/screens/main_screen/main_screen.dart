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
      body: Center(
        child: Container(),
      ),
    );
  }
}
