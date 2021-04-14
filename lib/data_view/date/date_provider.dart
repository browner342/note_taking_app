import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

DateTime getSystemTime() => DateTime.now();

class DateProvider extends ChangeNotifier {
  DateTime _showOnScreen;
  final DateTime Function() _currentTime;
  int _counter = 0;

  DateProvider(this._showOnScreen, [this._currentTime = getSystemTime]);

  void setDate(DateTime dateTime) {
    _showOnScreen = dateTime;
    notifyListeners();
  }

  DateTime getDate() => _showOnScreen;

  String getFormattedDate() {
    if (_showOnScreen.day == _currentTime().day) {
      return 'Today';
    } else if (_showOnScreen.day == _currentTime().add(Duration(days: 1)).day) {
      return 'Tomorrow';
    } else if (_showOnScreen.day ==
        _currentTime().add(Duration(days: -1)).day) {
      return 'Yesterday';
    }
    return DateFormat('EEE, d MMM').format(_showOnScreen);
  }

  void nextDay() {
    _showOnScreen = _currentTime();

    _counter++;
    _showOnScreen = _showOnScreen.add(Duration(days: _counter));

    notifyListeners();
  }

  void previousDay() {
    _showOnScreen = _currentTime();

    _counter--;
    _showOnScreen = _showOnScreen.add(Duration(days: _counter));

    notifyListeners();
  }
}
