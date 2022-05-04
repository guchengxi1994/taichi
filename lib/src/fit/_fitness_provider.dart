/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 20:30:58
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-04 20:43:17
 */
import 'dart:math';

import 'package:flutter/material.dart';

class FitnessController extends ChangeNotifier {
  double _screenWidth = 0;
  double _screenHeight = 0;

  double _designWidth = 360;
  double _designHeight = 700;

  double get width => _screenWidth;
  double get height => _screenHeight;

  double get scaleWidth => _screenWidth / _designWidth;

  double get scaleHeight => _screenHeight / _designHeight;

  double get scaleText => min(scaleWidth, scaleHeight);

  changeWidth(double v) {
    _screenWidth = v;
    notifyListeners();
  }

  changeHeight(double v) {
    _screenHeight = v;
    notifyListeners();
  }

  init({double? designWidth, double? designHeight}) {
    _designWidth = designWidth ?? 360;
    _designHeight = designHeight ?? 700;
    notifyListeners();
  }
}
