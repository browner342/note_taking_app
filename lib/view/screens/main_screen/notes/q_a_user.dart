import 'package:flutter/material.dart';
import 'package:note_taking_app/data_view/date/date_provider.dart';
import 'package:note_taking_app/data_view/q_a_provider/q_a_provider.dart';
import 'package:provider/provider.dart';

class QAUser extends StatelessWidget {
  QAUser(this.question, this.textController);

  final String question;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final qa = Provider.of<QAProvider>(context, listen: false);
    final dateTime = Provider.of<DateProvider>(context).getDateFNormal();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 0.1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(question),
          Container(
            child: new ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 250.0,
                maxWidth: 0.8 * MediaQuery.of(context).size.width,
              ),
              child: TextField(
                maxLines: null,
                controller: textController,
                onChanged: (value) {
                  qa.saveAns(dateTime);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
