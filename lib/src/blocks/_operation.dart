import 'package:flutter/material.dart';

/// 做过的操作，记录下来，用来回退

enum OperationType { changeWidth, changeHeight, moveTo, remove }

class WidgetState {
  Offset? offset;
  double? width;
  double? height;
  bool? isVisiable; //visible

  WidgetState({this.height, this.offset, this.isVisiable, this.width});
}

class Operate {
  /// 操作的 widget id
  int index;

  /// 操作状态
  WidgetState? preState;

  /// next state
  WidgetState? nextState;

  Operate({required this.index, this.preState, this.nextState});
}

class Operation {
  Operation._();
  List<Operate> operates = [];

  /// 最多只存储5个记录
  static const int maxLength = 5;

  static final Operation _instance = Operation._();

  addOperate(Operate op) {
    if (operates.length == maxLength) {
      operates.removeAt(0);
    }
    operates.add(op);
  }

  removeLast() {
    operates.removeLast();
  }

  factory Operation() {
    return _instance;
  }
}
