import 'package:flutter/material.dart';

class DropdownSearchController extends ChangeNotifier {
  List<String> datas = [];
  String searchStr = "";

  List<String> get fliteredData => datas
      .where(
        (element) => element.contains(searchStr),
      )
      .toList();

  void init(List<String> d) {
    datas = d;
    notifyListeners();
  }

  void changeSearchCondition(String condition) {
    searchStr = condition;
    notifyListeners();
  }
}
