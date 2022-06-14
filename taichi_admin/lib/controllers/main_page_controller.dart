import 'package:flutter/material.dart';

class MainPageController extends ChangeNotifier {
  String currentBodyName = "Dashboard";

  changeBodyName(String s) {
    currentBodyName = s;
    notifyListeners();
  }
}
