import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/data_view/date/date_provider.dart';
import 'package:provider/provider.dart';

class DateAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final date = Provider.of<DateProvider>(context);
    final dateFunc = Provider.of<DateProvider>(context, listen: false);

    _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateFunc.getDate(), // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != dateFunc.getDate())
        dateFunc.setDate(picked);
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {
              dateFunc.previousDay();
            },
          ),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Text(
              dateFunc.getFormattedDate(),
            ),
          ),
          IconButton(
            icon: Icon(CupertinoIcons.forward),
            onPressed: () {
              dateFunc.nextDay();
            },
          ),
        ],
      ),
    );
  }
}
