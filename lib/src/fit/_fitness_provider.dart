/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 20:30:58
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-03 21:01:47
 */
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

  changeWidth(double v) {
    _screenWidth = v;
    notifyListeners();
  }

  changeHeight(double v) {
    _screenHeight = v;
    notifyListeners();
  }

  init({double? designWidth, double? designHeight}) {
    designWidth = designWidth;
    designHeight = designHeight;
    notifyListeners();
  }
}
