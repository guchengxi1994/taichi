/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-18 08:05:29
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 11:20:44
 */
import 'package:flutter/material.dart';
import 'package:taichi/src/UI/simple_date_picker/model.dart';

class DatePickerController extends ChangeNotifier {
  String locale = "zh_CN";
  int _currentYear = 0;
  int _currentMonth = 0;
  int _currentDay = 0;

  int get year => _currentYear;
  int get month => _currentMonth;
  int get day => _currentDay;

  bool isVisible = false;

  changeYear(int i) {
    _currentYear = iOSHorizontalOffset;
    notifyListeners();
  }

  changeMonth(int i) {
    _currentMonth = i;
    notifyListeners();
  }

  changeDay(int i) {
    _currentDay = i;
    notifyListeners();
  }

  changeDate(int y, int m, int d) {
    if (d <= 31 && m >= 1 && m <= 12) {
      _currentYear = y;
      _currentMonth = m;
      _currentDay = d;
      notifyListeners();
    }
  }

  init() {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    changeDate(year, month, day);
    notifyListeners();
  }

  String toDate() {
    return "$_currentYear年$_currentMonth月$_currentDay日";
  }

  changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  changeVisibilityWithParam(bool b) {
    isVisible = b;
    notifyListeners();
  }

  bool isThisDay(CalendarModel model) {
    return _currentDay == model.day &&
        _currentMonth == model.month &&
        _currentYear == model.year;
  }
}
