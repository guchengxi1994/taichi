import 'package:flutter/material.dart';
import 'dart:math' as math;

part './t_stateless_widget.dart';
part './t_custom_stateless_widget.dart';
part './t_style.dart';

class TaichiGraph {
  static Widget simple({required double size}) {
    return _TaichiStatelessWidget(size: size);
  }

  static Widget custom(
      {required double size, Color? color1, Color? color2, double? angle}) {
    return _CustomTaichiStatelessWidget(
      size: size,
      color1: color1,
      color2: color2,
      angle: angle,
    );
  }

  static Widget fromStyle(TaichiGraphStyle style) {
    assert(style.validate());
    List<Color> colors1 = [];
    List<Color> colors2 = [];

    if (style.gradient) {
      var alpha1 = style.color1.alpha;
      var r1 = style.color1.red;
      var g1 = style.color1.green;
      var b1 = style.color1.blue;

      var alpha2 = style.color2.alpha;
      var r2 = style.color2.red;
      var g2 = style.color2.green;
      var b2 = style.color2.blue;
    }

    return Container();
  }
}
