// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '_t_block_wapper.dart';
import 'constants.dart';

class DragController extends ChangeNotifier {
  List<Widget> _currentWidgets = [];
  List<Widget> get widgets => _currentWidgets;
  double _screenWidth = 0;

  changeWidth(double w) {
    _screenWidth = w;
  }

  addWidget(Widget w, Offset offset) {
    if (offset.dx >= _screenWidth / 6) {
      _currentWidgets.add(Positioned(
          top: offset.dy - appbarHeight,
          left: offset.dx - _screenWidth / 6,
          child: BlocksWrapperWidget(
            index: 0,
            child: w,
          )));
      notifyListeners();
    }
  }

  removeWidget(Widget w) {
    _currentWidgets.remove(w);
    notifyListeners();
  }
}
