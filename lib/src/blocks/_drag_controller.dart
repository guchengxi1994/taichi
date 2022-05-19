/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-19 20:56:18
 */
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '_enums.dart';
import '_t_block_wapper.dart';
import '_constants.dart';

class BlockController extends ChangeNotifier {
  /// board type
  BoardType boardType = BoardType.stack;

  /// board direction
  BoardDirection boardDirection = BoardDirection.ttb;

  /// widgets in board
  List<Widget> _currentWidgets = [];
  List<Widget> get widgets => _currentWidgets;

  /// widget keys in board
  List<GlobalKey<BlocksWrapperWidgetState>> _globalKeys = [];
  List<GlobalKey<BlocksWrapperWidgetState>> get globalKeys => _globalKeys;

  /// screen width
  double screenWidth = 0;

  /// screen height
  double screenHeight = 0;

  /// widget index
  int currentIndex = 1;

  /// current selected widget
  int _currentSelectedWidgetId = -1;
  int get currentSelectedWidgetId => _currentSelectedWidgetId;

  /// 用于刷新右侧组件
  GlobalKey globalRightSideKey = GlobalKey();

  /// 获取当前操作的组件
  BlocksWrapperWidget get currentWidget =>
      _currentWidgets[_currentSelectedWidgetId - 1] as BlocksWrapperWidget;

  /// 获取当前操作组件的 globalkey
  GlobalKey<BlocksWrapperWidgetState> get currentKey =>
      _globalKeys[_currentSelectedWidgetId - 1];

  /// 设置当前选取的widget id
  changeCurrentId(int id) {
    _currentSelectedWidgetId = id;
    notifyListeners();
  }

  /// 动态设置widget的宽度
  changeSize(double w, double h) {
    screenWidth = w;
    screenHeight = h;
  }

  /// 添加一个widget
  addWidget(Widget w, Offset offset, String widgetType) {
    if (offset.dx >= screenWidth / 6 && offset.dx <= screenWidth / 6 * 5) {
      GlobalKey<BlocksWrapperWidgetState> key = GlobalKey();

      if (widgetType == "AppBar") {
        _currentWidgets.add(BlocksWrapperWidget(
          key: key,
          index: currentIndex,
          initialTop: 0,
          initialLeft: 0,
          widgetType: widgetType,
          child: w,
        ));
      } else {
        _currentWidgets.add(BlocksWrapperWidget(
          key: key,
          index: currentIndex,
          initialTop: offset.dy - BlockConstants.appbarHeight,
          initialLeft: offset.dx - screenWidth / 6,
          widgetType: widgetType,
          child: w,
        ));
      }

      _globalKeys.add(key);
      currentIndex += 1;
      notifyListeners();
    }
  }

  /// 移除一个widget
  removeWidget(Widget w) {
    _currentWidgets.remove(w);
    notifyListeners();
  }

  /// 根据id移除(控制可见性) widget
  removeWidgetById(int id) {
    // _currentWidgets.removeAt(id);
    // _globalKeys.removeAt(id);
    _globalKeys[id].currentState!.changeVisiable();
    notifyListeners();
  }
}
