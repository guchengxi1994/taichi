/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-24 19:04:56
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-24 20:57:14
 */

import 'dart:math' as math;

import 'package:flutter/material.dart';

class TaichiGraphRotateController extends ChangeNotifier {
  double _angle = 0;
  double get angle => _angle / 180 * math.pi;

  addAngle() {
    _angle += 1;
    notifyListeners();
  }

  minusAngle() {
    _angle -= 1;
    notifyListeners();
  }

  init({double initialAngle = 0}) {
    _angle = initialAngle;
    notifyListeners();
  }
}
