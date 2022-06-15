/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-15 18:48:30
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-15 20:45:58
 */
import 'package:flutter/material.dart';

class MainPageController extends ChangeNotifier {
  String currentBodyName = "Dashboard";
  String currentRoute = "/";
  String initRoute = "/";

  changeBodyName(String s, {String route = "test"}) {
    currentBodyName = s;
    currentRoute = route;
    notifyListeners();
  }
}
