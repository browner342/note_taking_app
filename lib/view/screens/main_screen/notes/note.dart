import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/data_view/date/date_provider.dart';
import 'package:note_taking_app/data_view/q_a_provider/q_a_provider.dart';
import 'package:note_taking_app/view/screens/main_screen/notes/q_a_user.dart';
import 'package:provider/provider.dart';

class Note extends StatelessWidget {
  List<QAUser> qABuilder(List questions, qa, String dateTime) {
    List<QAUser> holder = [];

    qa.getAns(dateTime);
    questions
        .forEach((element) => holder.add(QAUser(element.first, element.last)));

    return holder;
  }

  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<QAProvider>(context).questionsAns;
    final qa = Provider.of<QAProvider>(context, listen: false);
    final date = Provider.of<DateProvider>(context);

    return ListView(
      children: qABuilder(questions, qa, date.getDateFNormal()),
    );
  }
}
