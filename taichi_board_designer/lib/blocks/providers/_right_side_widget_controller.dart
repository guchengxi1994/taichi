import 'package:flutter/material.dart';

class RightSideWidgetController extends ChangeNotifier {
  bool _isChange = false;
  changeWidgetStatus() {
    _isChange = !_isChange;
    notifyListeners();
  }

  bool get isChange => _isChange;

  String _widgetType = "";
  changeWidgetType(String s) {
    _widgetType = s;
    notifyListeners();
  }

  String get widgetType => _widgetType;
}
