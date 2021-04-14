import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';
import 'package:note_taking_app/view/screens/main_screen/components/date/date_app_bar.dart';
import 'package:note_taking_app/view/screens/main_screen/components/side_drawer.dart';
import 'package:note_taking_app/view/screens/main_screen/notes/note.dart';

class MainScreen extends StatelessWidget {
  static const String id = kMainScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: DateAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Note(),
      ),
    );
  }
}
