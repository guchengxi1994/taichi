/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:29:37
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-28 22:20:36
 */
import 'package:flutter/material.dart';
import 'package:taichi_accessible_widget/access_model.dart';

class AccessController extends ChangeNotifier {
  AccessModel model = AccessModel();

  changeModel(AccessModel m) {
    model = m;
    notifyListeners();
  }
}
