import 'dart:math' as math;

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

extension Compare on String {
  /// if this is a num string
  ///
  /// try convert it to num first
  ///
  /// then do [>=] operation
  bool? operator >=(Object o) {
    if (o.runtimeType != String) {
      return null;
    }

    // if [this is int] and [o is int]
    if (int.tryParse(this) != null && int.tryParse(o as String) != null) {
      return int.tryParse(this)! >= int.tryParse(o)!;
    }

    // if [this is double] and [o is double]
    if (double.tryParse(this) != null && double.tryParse(o as String) != null) {
      return double.tryParse(this)! >= double.tryParse(o)!;
    }

    return null;
  }

  /// same as [>=]
  bool? operator <=(Object o) {
    if (o.runtimeType != String) {
      return null;
    }

    // if [this is int] and [o is int]
    if (int.tryParse(this) != null && int.tryParse(o as String) != null) {
      return int.tryParse(this)! <= int.tryParse(o)!;
    }

    // if [this is double] and [o is double]
    if (double.tryParse(this) != null && double.tryParse(o as String) != null) {
      return double.tryParse(this)! <= double.tryParse(o)!;
    }

    return null;
  }
}
