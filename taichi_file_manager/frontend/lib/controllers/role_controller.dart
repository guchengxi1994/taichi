import 'package:flutter/material.dart';

class RoleController extends ChangeNotifier {
  bool isDeveloper = false;

  changeRole(bool b) {
    isDeveloper = b;
    notifyListeners();
  }
}
