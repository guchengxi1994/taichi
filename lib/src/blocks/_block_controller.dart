/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-22 20:48:52
 */
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '_enums.dart';
import '_operation.dart';
import '_block_wapper.dart';
import '_constants.dart';

class BlockController extends ChangeNotifier {
  /// board type
  BoardType boardType = BoardType.stack;

  /// 操作记录
  Operation _operation = Operation();

  Operation get operation => _operation;

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

  changeBoardType(BoardType b) {
    if (boardType != b) {
      boardType = b;
      notifyListeners();
    }
  }

  /// 获取当前操作的组件
  BlocksWrapperWidget get currentWidget =>
      _currentWidgets[_currentSelectedWidgetId - 1] as BlocksWrapperWidget;

  /// 根据id返回widget
  GlobalKey<BlocksWrapperWidgetState> getKeyById(int index) {
    return _globalKeys[index - 1];
  }

  /// 获取当前操作组件的 globalkey
  GlobalKey<BlocksWrapperWidgetState> get currentKey =>
      _globalKeys[_currentSelectedWidgetId - 1];

  /// 设置当前选取的widget id
  changeCurrentId(int id) {
    _currentSelectedWidgetId = id;
    notifyListeners();
  }

  List<Widget> getVisibleWidgets() {
    List<Widget> res = [];
    for (int k = 0; k < globalKeys.length; k++) {
      if (globalKeys[k].currentState!.isVisiable) {
        res.add(_currentWidgets[k]);
      }
    }
    return res;
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
      switch (widgetType) {
        case "AppBar":
          _currentWidgets.add(BlocksWrapperWidget(
            key: key,
            index: currentIndex,
            initialTop: 0,
            initialLeft: 0,
            widgetType: widgetType,
            childType: ChildType.custom,
            child: w,
          ));
          break;
        case "Container":
          _currentWidgets.add(BlocksWrapperWidget(
            key: key,
            index: currentIndex,
            initialTop: offset.dy - BlockConstants.appbarHeight,
            initialLeft: offset.dx - screenWidth / 6,
            widgetType: widgetType,
            childType: ChildType.single,
            child: w,
          ));
          break;
        case "SizedBox":
          _currentWidgets.add(BlocksWrapperWidget(
            key: key,
            index: currentIndex,
            initialTop: offset.dy - BlockConstants.appbarHeight,
            initialLeft: offset.dx - screenWidth / 6,
            widgetType: widgetType,
            childType: ChildType.single,
            child: w,
          ));
          break;
        case "Text":
          _currentWidgets.add(BlocksWrapperWidget(
            key: key,
            index: currentIndex,
            initialTop: offset.dy - BlockConstants.appbarHeight,
            initialLeft: offset.dx - screenWidth / 6,
            widgetType: widgetType,
            childType: ChildType.none,
            child: w,
          ));
          break;
        case "TextField":
          _currentWidgets.add(BlocksWrapperWidget(
            key: key,
            index: currentIndex,
            initialTop: offset.dy - BlockConstants.appbarHeight,
            initialLeft: offset.dx - screenWidth / 6,
            widgetType: widgetType,
            childType: ChildType.none,
            child: w,
          ));
          break;
        default:
          break;
      }

      _globalKeys.add(key);
      currentIndex += 1;
      notifyListeners();
    }
  }

  /// 修改父节点
  ///
  /// custom类型的暂时还没有想好怎么处理
  changeAncestor({required int ancestorIndex}) {
    var key = getKeyById(ancestorIndex);
    if (key.currentState!.widget.childType != ChildType.none &&
        key.currentState!.widget.childType != ChildType.custom &&
        (key.currentState!.hasChild == false ||
            key.currentState!.widget.childType == ChildType.multi)) {
      currentKey.currentState!.changeAncestorIndex(ancestorIndex);
      if (key.currentState!.widget.childType == ChildType.single) {
        key.currentState!.changeHasChildStatus(true);
      }

      notifyListeners();
    }
  }

  /// 移除一个widget
  @Deprecated("use ```changeState``` instead")
  removeWidget(Widget w) {
    _currentWidgets.remove(w);
    notifyListeners();
  }

  /// 根据id移除(控制可见性) widget
  @Deprecated("use ```changeState``` instead")
  removeWidgetById(int id) {
    _globalKeys[id].currentState!.changeVisiable();
    notifyListeners();
  }

  /// alpha+2 版本添加的方法
  ///
  /// 由于需要完成操作回退的功能，
  ///
  /// 所以定义了 ```Operation``` 类以及
  ///
  /// ```WidgetState``` 类
  ///
  /// 通过 changeState 直接修改 Widget的状态，
  ///
  /// 不再需要先前各个属性值逐一修改了
  changeState(
      {WidgetState? prev,
      required WidgetState current,
      required int index,
      required OperationType operationType,
      bool addOperate = true}) {
    _globalKeys[index].currentState!.changeState(current: current);
    if (addOperate) {
      _operation.addOperate(Operate(
          index: index,
          preState: prev,
          nextState: current,
          operationType: operationType));
    }
    if (operationType == OperationType.remove) {
      var ancestorKey =
          getKeyById(_globalKeys[index].currentState!.ancestorIndex);
      if (ancestorKey.currentState!.widget.childType == ChildType.single) {
        ancestorKey.currentState!.changeHasChildStatus(false);
      }
    }
    notifyListeners();
  }

  undo() {
    if (_operation.operates.isNotEmpty) {
      Operate op = _operation.operates.removeLast();
      changeState(
          current: op.preState!,
          index: op.index,
          addOperate: false,
          operationType: OperationType.undo);
      if (op.preState!.isVisiable == true) {
        var ancestorKey =
            getKeyById(_globalKeys[op.index].currentState!.ancestorIndex);
        if (ancestorKey.currentState!.widget.childType == ChildType.single) {
          ancestorKey.currentState!.changeHasChildStatus(true);
        }
      }
      notifyListeners();
    }
  }
}
