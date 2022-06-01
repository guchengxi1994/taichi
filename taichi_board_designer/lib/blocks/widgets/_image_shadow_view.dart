import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_board_designer/blocks/providers/_main_block_controller.dart';

import '_container.dart';

class ShadowContainerView extends StatefulWidget {
  const ShadowContainerView({Key? key}) : super(key: key);

  @override
  ShadowContainerViewState createState() => ShadowContainerViewState();
}

class ShadowContainerViewState extends State<ShadowContainerView> {
  Color backgroundColor = Colors.grey;
  double radius = 20;
  TCustomContainerDecorationState decorationState =
      TCustomContainerDecorationState();

  double factor = 1.1;
  // double containerSize = 300;

  @override
  void initState() {
    super.initState();
    decorationState.borderRadius = BorderRadius.circular(radius);
    decorationState.color = backgroundColor;
  }

  changeRadius(double data) {
    setState(() {
      radius = data;
      decorationState.borderRadius = BorderRadius.circular(data);
    });
  }

  changeBackgroundColor(Color c) {
    setState(() {
      backgroundColor = c;
      decorationState.color = c;
    });
  }

  showBackgroundImage(bool b) {
    setState(() {
      decorationState.showDemoImage = b;
    });
  }

  setBorder(Border b, bool showBorder, {bool noRadius = false}) {
    setState(() {
      decorationState.border = b;
      decorationState.showBorder = showBorder;
      if (noRadius) {
        decorationState.borderRadius = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: factor * context.watch<BlockController>().screenWidth * 0.8 / 6,
      height: factor * context.watch<BlockController>().screenWidth * 0.8 / 6,
      color: Colors.white,
      child: Container(
        height: context.watch<BlockController>().screenWidth * 0.8 / 6 * factor,
        width: context.watch<BlockController>().screenWidth * 0.8 / 6 * factor,
        decoration: decorationState.toBoxDecoration(),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(radius),
        //     boxShadow: [BoxShadow(color: shadowColor, blurRadius: 20)],
        //     image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.fill)),
      ),
    );
  }
}
