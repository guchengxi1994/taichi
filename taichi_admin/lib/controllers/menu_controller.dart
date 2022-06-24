/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 11:43:56
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 17:54:20
 */

import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  bool _isExpanded = true;
  changeExpansion(bool b) {
    _isExpanded = b;
    notifyListeners();
  }

  bool get isExpanded => _isExpanded;
}
