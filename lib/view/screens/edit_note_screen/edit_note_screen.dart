import 'package:flutter/material.dart';
import 'package:note_taking_app/view/constants/constants.dart';

class EditNoteScreen extends StatelessWidget {
  static const String id = kEditNoteScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(),
    );
  }
}
