/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-23 19:56:19
 */
import 'package:flutter/material.dart';

class BlockConstants {
  static const String version = "dev6";
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

/// 组件的cild type
///
/// none : 无child, 如 Text, TextField
///
/// single: 单child , 如Container
///
/// multi: children，如Wrap，Row
///
/// custom: 自定义的child类型，例如 AppBar的title属性等
enum ChildType { none, single, multi, custom }
