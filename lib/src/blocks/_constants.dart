/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-21 19:23:21
 */
import 'package:flutter/material.dart';

class BlockConstants {
  static const String version = "alpha+3-pre";
  BlockConstants._();
  static const double appbarHeight = 50;
  static const double maxLineLength = 100;
  static const double taichiDraggableWidgetSize = 100;
  static const Color bodyWidgetInitialColor = Colors.blue;
  static const Color leftDragglableWidgetColor = Colors.red;
  static const double inputHeight = 40;
  static const List<String> supportedTypes = [
    "Container",
    "SizedBox",
    "AppBar",
    "Text",
    "TextField",
  ];
}

final Map<String, String> introductionOfWidgets = {
  "Container":
      "A convenience widget that combines common painting, positioning, and sizing",
  "SizedBox": "A box with a specified size.",
  "AppBar": "A material design app bar.",
  "Text": "A run of text with a single style.",
  "TextField": "A material design text field."
};
