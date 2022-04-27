import 'package:flutter/material.dart';

class ProcessLoaderController extends ChangeNotifier {
  double _value = 0;

  double get value => _value;

  changeValue({double step = 1}) {
    _value += step;
    if ((_value <= 100) && (_value >= 0)) {
      notifyListeners();
    }
  }

  setInitialValue(double v) {
    assert(v >= 0);
    _value = v;
    notifyListeners();
  }
}
