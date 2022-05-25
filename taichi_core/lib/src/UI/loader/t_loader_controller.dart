import 'package:flutter/material.dart';

class ProcessLoaderController extends ChangeNotifier {
  double _value = 0;

  double get value => _value;

  double _max = 100;
  double _min = 0;

  bool get canFinish => (_value >= _max) || (_value <= _min);

  changeValue({double step = 1}) {
    _value += step;
    if ((_value <= _max) && (_value >= _min)) {
      notifyListeners();
    }
  }

  setInitialValue(double v) {
    assert(v >= 0);
    _value = v;
    notifyListeners();
  }

  setMax({double max = 100}) {
    assert(max >= _min);
    _max = max;
    notifyListeners();
  }

  @Deprecated("unnecessary")
  setMin({double min = 0}) {
    assert(min <= _max);
    _min = min;
    notifyListeners();
  }
}
