import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateProvider extends ChangeNotifier {
  DateTime showOnScreen;
  int _counter = 0;

  DateProvider(DateTime dateTime) {
    showOnScreen = dateTime;
  }

  void setDate(DateTime dateTime) {
    showOnScreen = dateTime;
    notifyListeners();
  }

  String getFormattedDate() {
    if (showOnScreen.day == DateTime.now().day) {
      return 'Today';
    } else if (showOnScreen.day == DateTime.now().add(Duration(days: 1)).day) {
      return 'Tomorrow';
    } else if (showOnScreen.day == DateTime.now().add(Duration(days: -1)).day) {
      return 'Yesterday';
    }
    return DateFormat('EEE, d MMM').format(showOnScreen);
  }

  void nextDay() {
    showOnScreen = DateTime.now();

    _counter++;
    showOnScreen = showOnScreen.add(Duration(days: _counter));

    notifyListeners();
  }

  void previousDay() {
    showOnScreen = DateTime.now();

    _counter--;
    showOnScreen = showOnScreen.add(Duration(days: _counter));

    notifyListeners();
  }
}
