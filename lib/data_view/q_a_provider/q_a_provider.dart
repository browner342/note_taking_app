import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QAProvider extends ChangeNotifier {
  List questionsAns = [
    Pair("What have you done today?", TextEditingController()),
    Pair('What you wanted to do but have not managed it?',
        TextEditingController()),
    Pair("Tips for future You", TextEditingController()),
  ];

  void getAns(String dateTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    questionsAns.forEach((element) {
      if (prefs.containsKey(element.first + dateTime))
        element.last.text = prefs.getString(element.first + dateTime);
      else
        element.last.text = '';
    });
  }

  void saveAns(String dateTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    questionsAns.forEach((element) {
      prefs.setString(element.first + dateTime, element.last.text);
    });
  }
}
