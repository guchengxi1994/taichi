/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-18 22:03:12
 */
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '_t_block_wapper.dart';
import 'constants.dart';

class BlockController extends ChangeNotifier {
  /// widgets in board
  List<Widget> _currentWidgets = [];
  List<Widget> get widgets => _currentWidgets;

  /// widget keys in board
  List<GlobalKey<BlocksWrapperWidgetState>> _globalKeys = [];
  List<GlobalKey<BlocksWrapperWidgetState>> get globalKeys => _globalKeys;

  /// widget index
  double screenWidth = 0;
  int currentIndex = 1;

  /// current selected widget
  int _currentSelectedWidgetId = -1;
  int get currentSelectedWidgetId => _currentSelectedWidgetId;

  BlocksWrapperWidget get currentWidget =>
      _currentWidgets[_currentSelectedWidgetId - 1] as BlocksWrapperWidget;
  GlobalKey<BlocksWrapperWidgetState> get currentKey =>
      _globalKeys[_currentSelectedWidgetId - 1];

  /// 设置当前选取的widget id
  changeCurrentId(int id) {
    _currentSelectedWidgetId = id;
    notifyListeners();
  }

  /// 动态设置widget的宽度
  changeWidth(double w) {
    screenWidth = w;
  }

  addWidget(Widget w, Offset offset, String widgetType) {
    if (offset.dx >= screenWidth / 6 && offset.dx <= screenWidth / 6 * 5) {
      GlobalKey<BlocksWrapperWidgetState> key = GlobalKey();
      _currentWidgets.add(BlocksWrapperWidget(
        key: key,
        index: currentIndex,
        initialTop: offset.dy - BlockConstants.appbarHeight,
        initialLeft: offset.dx - screenWidth / 6,
        widgetType: widgetType,
        child: w,
      ));
      _globalKeys.add(key);
      currentIndex += 1;
      notifyListeners();
    }
  }

  removeWidget(Widget w) {
    _currentWidgets.remove(w);
    notifyListeners();
  }

  removeWidgetById(int id) {
    _currentWidgets.removeAt(id);
    _globalKeys.removeAt(id);
    notifyListeners();
  }
}
