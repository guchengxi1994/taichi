import 'dart:math' as math;
import 'package:lpinyin/lpinyin.dart';

final chineseRegex = RegExp("[\\u4e00-\\u9fa5]+");

extension MathExtension on String {
  double? square() {
    final double? v = double.tryParse(this);
    if (v != null) {
      return v * v;
    }
    return v;
  }

  num? pow(num e) {
    final double? v = double.tryParse(this);
    if (v != null) {
      return math.pow(v, e);
    }
    return null;
  }
}

final List<String> _orders = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

extension Compare on String {
  /// if this is a num string
  ///
  /// try convert it to num first
  ///
  /// then do [>] operation
  bool? operator >(Object o) {
    if (o.runtimeType != String) {
      return null;
    }

    // if this is empty or o is empty
    if (isEmpty || (o as String).isEmpty) {
      return null;
    }

    // if [this is int] and [o is int]
    if (int.tryParse(this) != null && int.tryParse(o) != null) {
      return int.tryParse(this)! > int.tryParse(o)!;
    }

    // if [this is double] and [o is double]
    if (double.tryParse(this) != null && double.tryParse(o) != null) {
      return double.tryParse(this)! > double.tryParse(o)!;
    }

    // if [this is english str] and [o is english str]
    _orders.addAll(_orders.map((e) => e.toLowerCase()).toList());
    if (_orders.contains(this[0]) && (_orders.contains(o[0]))) {
      return _orders.indexOf(this[0]) > _orders.indexOf(o[0]);
    }

    // if [this is chinese str] and [o is chinese str]
    if (chineseRegex.hasMatch(this[0]) && chineseRegex.hasMatch(o[0])) {
      final py1 = PinyinHelper.getShortPinyin(this[0]);
      final py2 = PinyinHelper.getShortPinyin(o[0]);
      return _orders.indexOf(py1) > _orders.indexOf(py2);
    }

    return null;
  }

  /// same as [>]
  bool? operator <(Object o) {
    if (o.runtimeType != String) {
      return null;
    }

    // if this is empty or o is empty
    if (isEmpty || (o as String).isEmpty) {
      return null;
    }

    // if [this is int] and [o is int]
    if (int.tryParse(this) != null && int.tryParse(o) != null) {
      return int.tryParse(this)! < int.tryParse(o)!;
    }

    // if [this is double] and [o is double]
    if (double.tryParse(this) != null && double.tryParse(o) != null) {
      return double.tryParse(this)! < double.tryParse(o)!;
    }

    // if [this is english str] and [o is english str]
    _orders.addAll(_orders.map((e) => e.toLowerCase()).toList());
    if (_orders.contains(this[0]) && (_orders.contains(o[0]))) {
      return _orders.indexOf(this[0]) < _orders.indexOf(o[0]);
    }

    // if [this is chinese str] and [o is chinese str]
    if (chineseRegex.hasMatch(this[0]) && chineseRegex.hasMatch(o[0])) {
      final py1 = PinyinHelper.getShortPinyin(this[0]);
      final py2 = PinyinHelper.getShortPinyin(o[0]);
      return _orders.indexOf(py1) < _orders.indexOf(py2);
    }

    return null;
  }

  bool? operator >=(Object o) {
    return !(this == o) ? this > o : true;
  }

  bool? operator <=(Object o) {
    return (this == o) ? true : this < o;
  }

  bool isBool() {
    if (this == "true" || this == "false") {
      return true;
    }
    return false;
  }

  /// use [isBool] before use this function
  bool convertStringToBool() {
    return this == "true";
  }

  bool isNull() {
    return this == "null";
  }

  /// use [isNull] before use this function
  String convertStringToNull() {
    return "null";
  }
}
