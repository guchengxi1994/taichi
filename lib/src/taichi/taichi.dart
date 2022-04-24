import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/utils.dart';

part './t_stateless_widget.dart';
part './t_custom_stateless_widget.dart';

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
}
