import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_board_designer/blocks/providers/_main_block_controller.dart';

import 'widget_styles/_container_style.dart';

class ShadowContainerView extends StatefulWidget {
  const ShadowContainerView({Key? key}) : super(key: key);

  @override
  ShadowContainerViewState createState() => ShadowContainerViewState();
}

class ShadowContainerViewState extends State<ShadowContainerView> {
  Color backgroundColor = Colors.grey;
  double radius = 20;
  TCustomContainerDecorationStyle decorationStyle =
      TCustomContainerDecorationStyle();

  double factor = 1.1;
  // double containerSize = 300;

  @override
  void initState() {
    super.initState();
    decorationStyle.borderRadius = BorderRadius.circular(radius);
    decorationStyle.color = backgroundColor;
  }

  changeRadius(double data) {
    setState(() {
      radius = data;
      decorationStyle.borderRadius = BorderRadius.circular(data);
    });
  }

  changeBackgroundColor(Color c) {
    setState(() {
      backgroundColor = c;
      decorationStyle.color = c;
    });
  }

  showBackgroundImage(bool b) {
    setState(() {
      decorationStyle.showDemoImage = b;
    });
  }

  setBorder(Border b, bool showBorder, {bool noRadius = false}) {
    setState(() {
      decorationStyle.border = b;
      decorationStyle.showBorder = showBorder;
      if (noRadius) {
        decorationStyle.borderRadius = null;
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
        decoration: decorationStyle.toBoxDecoration(),
      ),
    );
  }

  String toCode() {
    var outter = "BoxDecoration( {inner} ),";
    List<String> inner = [];
    if (decorationStyle.showDemoImage != null &&
        decorationStyle.showDemoImage!) {
      inner.add("image: , // here is your image");
    }

    if (decorationStyle.showBorder != null && decorationStyle.showBorder!) {
    } else {
      inner.add("border: null,");
    }

    return outter.replaceAll("{inner}", inner.join(","));
  }
}

/// 把`Border`转换为代码的`extension`
extension ToCode on Border {
  String toCode() {
    debugPrint("[ top ]: ${top.toString()}");
    return "";
  }
}
