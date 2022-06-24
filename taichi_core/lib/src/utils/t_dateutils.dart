// ignore_for_file: non_constant_identifier_names

class TDateUtils {
  final DateTime _dateTime = DateTime.now();
  int get year => _dateTime.year;
  int get month => _dateTime.month;
  List<String> months_CN = [
    "月份",
    "1月",
    "2月",
    "3月",
    "4月",
    "5月",
    "6月",
    "7月",
    "8月",
    "9月",
    "10月",
    "11月",
    "12月"
  ];

  List<String> months_en = [
    "Month",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];

  int getCurrentMonthDays(int year, int month) {
    Map<String, int> data = {
      "title": 31,
      "1": 31,
      "2": ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 29 : 28,
      "3": 31,
      "4": 30,
      "5": 31,
      "6": 30,
      "7": 31,
      "8": 31,
      "9": 30,
      "10": 31,
      "11": 30,
      "12": 31,
    };

    return data[month.toString()]!;
  }

  Map<String, int> get data => {
        "title": 31,
        "1": 31,
        "2": ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 29 : 28,
        "3": 31,
        "4": 30,
        "5": 31,
        "6": 30,
        "7": 31,
        "8": 31,
        "9": 30,
        "10": 31,
        "11": 30,
        "12": 31,
      };
}
