import 'package:flutter/material.dart';

/// ```T``` for ```taichi```
// class TCustomContainer extends StatefulWidget {
//   const TCustomContainer({Key? key}) : super(key: key);

//   @override
//   State<TCustomContainer> createState() => TCustomContainerState();
// }

// class TCustomContainerState extends State<TCustomContainer> {
//   late TCustomContainerDecorationState customContainerState;
//   @override
//   void initState() {
//     super.initState();
//     customContainerState = TCustomContainerDecorationState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: customContainerState.toBoxDecoration(),
//     );
//   }
// }

/// ```T``` for ```taichi```
class TCustomContainerDecorationState {
  Color color;
  DecorationImage? image;
  BoxBorder? border;
  BorderRadiusGeometry? borderRadius;
  List<BoxShadow>? boxShadow;
  Gradient? gradient;
  BlendMode? backgroundBlendMode;
  BoxShape shape;

  TCustomContainerDecorationState(
      {this.color = Colors.grey,
      this.image,
      this.border,
      this.borderRadius,
      this.backgroundBlendMode,
      this.boxShadow,
      this.gradient,
      this.shape = BoxShape.rectangle});

  BoxDecoration toBoxDecoration() {
    return BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        backgroundBlendMode: backgroundBlendMode,
        boxShadow: boxShadow,
        gradient: gradient,
        shape: shape);
  }
}
