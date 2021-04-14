import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/data_view/date/date_provider.dart';

void main() {
  DateProvider dateProvider,
      dateProviderToday,
      dateProviderTomorrow,
      dateProviderYesterday;

  setUp(() {
    dateProvider =
        DateProvider(DateTime(2000, 1, 2), () => DateTime(2000, 1, 8));
    dateProviderToday =
        DateProvider(DateTime(2000, 1, 2), () => DateTime(2000, 1, 2));
    dateProviderTomorrow =
        DateProvider(DateTime(2000, 1, 2), () => DateTime(2000, 1, 1));
    dateProviderYesterday =
        DateProvider(DateTime(2000, 1, 2), () => DateTime(2000, 1, 3));
  });

  group("Given class DateProvider", () {
    test('When getDate call should return date', () {
      expect(dateProvider.getDate(), DateTime(2000, 1, 2));
    });

    test('When setDate call with new date should change date for a new one',
        () {
      // setting new date
      dateProvider.setDate(DateTime(2082, 1, 2));

      // checking new date
      expect(dateProvider.getDate(), DateTime(2082, 1, 2));
    });

    group('When getFormattedDate call should return formatted string', () {
      test('When picked date is today should return string Today', () {
        expect(dateProviderToday.getFormattedDate(), 'Today');
      });

      test('When picked date is tomorrow should return string Tomorrow', () {
        expect(dateProviderTomorrow.getFormattedDate(), 'Tomorrow');
      });

      test('When picked date is yesterday should return string Yesterday', () {
        expect(dateProviderYesterday.getFormattedDate(), 'Yesterday');
      });

      test('When picked date should return string formatted date', () {
        expect(dateProvider.getFormattedDate(), 'Sun, 2 Jan');
      });
    });

    test('When nextDay call should set date on the next day', () {
      dateProvider.nextDay();
      expect(dateProvider.getDate(), DateTime(2000, 1, 9));
    });

    test('When previousDay call should set date on the previous day', () {
      dateProvider.previousDay();
      expect(dateProvider.getDate(), DateTime(2000, 1, 7));
    });
  });
}
