import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import '_basic_widget.dart';
import 't_rotate_controller.dart';
import '../utils/unfinished.dart';

part './t_stateless_widget.dart';
part './t_custom_stateless_widget.dart';
part './t_style.dart';
part './t_overlay_widget.dart';
part './t_auto_rotate_widget.dart';
part './t_split_widget.dart';
part './t_uchiha.dart';

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

  static Widget uchiha({double size = 300, Color color = Colors.blue}) {
    return _Uchiha(
      size: size,
      color: color,
    );
  }

  static Widget splited(
      {required Color color, required double size, required bool gradient}) {
    return _SplitedTaichi(
      color: color,
      size: size,
      gradient: gradient,
    );
  }

  static Widget fromStyle(TaichiGraphStyle style) {
    assert(style.validate());

    return Transform.rotate(
      angle: style.angle,
      child: Container(
        height: style.size,
        width: style.size,
        decoration: BoxDecoration(
            color: style.color2,
            borderRadius: BorderRadius.circular(0.5 * style.size),
            border: Border.all(color: style.color1)),
        child: Stack(children: [
          // left side
          Positioned(
              child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(style.size),
                topLeft: Radius.circular(style.size)),
            child: Container(
                height: style.size,
                width: 0.5 * style.size,
                decoration: BoxDecoration(
                    color: style.color1,
                    border: Border(left: BorderSide(color: style.color1)))),
          )),

          // center  circle
          Positioned(
              top: 0,
              left: 0.25 * style.size,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(0.25 * style.size)),
                // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
                child: Container(
                    height: 0.5 * style.size,
                    width: 0.5 * style.size,
                    decoration: BoxDecoration(
                      color: style.color2,
                    )),
              )),

          // center  circle
          Positioned(
              bottom: 0,
              right: 0.25 * style.size,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(0.25 * style.size)),
                // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
                child: Container(
                  height: 0.5 * style.size,
                  width: 0.5 * style.size,
                  decoration: BoxDecoration(
                    color: style.color1,
                  ),
                ),
              )),

          // small  dot
          Positioned(
              top: style.dotFactor *
                  style.size *
                  1.5 /
                  (style.dotFactor / 0.125),
              left: 0.5 * style.size - style.dotFactor * 0.5 * style.size,
              height: style.dotFactor * style.size,
              width: style.dotFactor * style.size,
              child: Container(
                decoration: BoxDecoration(
                  color: style.dotColor1,
                  borderRadius:
                      BorderRadius.circular(style.dotFactor * style.size),
                ),
              )),

          // small  dot
          Positioned(
              bottom: style.dotFactor *
                  1.5 *
                  style.size /
                  (style.dotFactor / 0.125),
              left: 0.5 * style.size - style.dotFactor * 0.5 * style.size,
              height: style.dotFactor * style.size,
              width: style.dotFactor * style.size,
              child: Container(
                decoration: BoxDecoration(
                  color: style.dotColor2,
                  borderRadius:
                      BorderRadius.circular(style.dotFactor * style.size),
                ),
              )),
        ]),
      ),
    );
  }
}

class TaichiAutoRotateGraph {
  static Widget simple({double size = 300, int fps = 24}) {
    return ChangeNotifierProvider(
      create: (_) => TaichiGraphRotateController()..init(initialAngle: 0.0),
      child: _SimpleTaichiAutoRotateWidget(
        size: size,
        fps: fps,
      ),
    );
  }
}

class TaichiOverlay {
  static Widget simple(
      {required bool isLoading,
      required Widget child,
      double opacity = 0.5,
      Color? color,
      double size = 100}) {
    return _SimpleTaichiLoadingOverlay(
      isLoading: isLoading,
      color: color,
      opacity: opacity,
      size: size,
      child: child,
    );
  }
}
