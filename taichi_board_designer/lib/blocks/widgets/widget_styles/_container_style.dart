import 'package:flutter/material.dart';
import '_abstract_style.dart';

/// ```T``` for ```taichi```
class TCustomContainerDecorationStyle extends AbstractStyle {
  static const String imgPath =
      'packages/taichi_board_designer/assets/demo.png';

  Color color;
  DecorationImage? image;
  BoxBorder? border;
  BorderRadiusGeometry? borderRadius;
  List<BoxShadow>? boxShadow;
  Gradient? gradient;
  BlendMode? backgroundBlendMode;
  BoxShape shape;
  bool? showDemoImage;
  bool? showBorder;

  TCustomContainerDecorationStyle(
      {this.color = Colors.grey,
      this.image,
      this.border,
      this.borderRadius,
      this.backgroundBlendMode,
      this.boxShadow,
      this.gradient,
      this.shape = BoxShape.rectangle,
      this.showDemoImage = false,
      this.showBorder = false});

  BoxDecoration toBoxDecoration() {
    return BoxDecoration(
        color: color,
        image: (showDemoImage != null && showDemoImage!)
            ? const DecorationImage(
                image: AssetImage(imgPath), fit: BoxFit.fill)
            : null,
        border: (showBorder != null && showBorder!) ? border : null,
        borderRadius: borderRadius,
        backgroundBlendMode: backgroundBlendMode,
        boxShadow: boxShadow,
        gradient: gradient,
        shape: shape);
  }
}
