import 'day_box.dart';

class EventDays {
  DateTime date;
  int index;
  BoxStatus status;

  EventDays({required this.date, required this.index, required this.status});

  @override
  bool operator ==(Object other) {
    if (other is! EventDays) {
      return false;
    }
    return (other).date == date;
  }

  @override
  int get hashCode => date.hashCode;
}

extension Eq on DateTime {
  bool simpleEquals(Object other) {
    if (other is! DateTime) {
      return false;
    }

    return other.day == day && other.month == month && other.year == year;
  }
}
