/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 20:30:58
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-04 19:50:54
 */
import 'dart:math';

import 'package:flutter/material.dart';

class FitnessController extends ChangeNotifier {
  double _screenWidth = 0;
  double _screenHeight = 0;

  final double? designWidth = 360;
  final double? designHeight = 700;

  double get width => _screenWidth;
  double get height => _screenHeight;

  double get scaleWidth => _screenWidth / (designWidth ?? 360);

  double get scaleHeight => _screenHeight / (designHeight ?? 700);

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
    designWidth = designWidth ?? 360;
    designHeight = designHeight ?? 700;
    notifyListeners();
  }
}
