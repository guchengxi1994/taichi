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
