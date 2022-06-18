/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-18 08:55:08
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 09:22:32
 */
import 'package:flutter/material.dart';

class DefaultStyle {
  DefaultStyle._();

  static final selectedStyle = BoxDecoration(
    color: Colors.green.withOpacity(0.4),
    shape: BoxShape.circle,
  );

  static const monthTitleColor = Colors.amber;

  static const double defaultWidth = 300;
  static const double defaultHeight = 50;
}
