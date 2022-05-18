/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-18 22:00:38
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_drag_controller.dart';
import 'constants.dart';

// ignore: must_be_immutable
class BlocksWrapperWidget extends StatefulWidget {
  BlocksWrapperWidget(
      {Key? key,
      required this.child,
      required this.index,
      required this.initialLeft,
      required this.initialTop,
      this.widgetType = "Container"})
      : super(key: key);
  Widget child;
  int index;
  double initialTop;
  double initialLeft;
  String widgetType;

  @override
  State<BlocksWrapperWidget> createState() => BlocksWrapperWidgetState();
}

class BlocksWrapperWidgetState extends State<BlocksWrapperWidget> {
  double width = BlockConstants.taichiDraggableWidgetSize;
  double height = BlockConstants.taichiDraggableWidgetSize;
  Color color = BlockConstants.bodyWidgetInitialColor;

  late double left;
  late double top;

  @override
  void initState() {
    super.initState();
    left = widget.initialLeft;
    top = widget.initialTop;
  }

  void setWidth(double w) {
    setState(() {
      width = w;
    });
  }

  void setHeight(double h) {
    setState(() {
      height = h;
    });
  }

  void setColor(Color c) {
    setState(() {
      color = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: Draggable(
          onDragEnd: (details) {
            double widgetWidth = context.read<BlockController>().screenWidth;
            setState(() {
              top = details.offset.dy - BlockConstants.appbarHeight;
              left = details.offset.dx - widgetWidth / 6;
            });
          },
          onDragStarted: () {
            context.read<BlockController>().changeCurrentId(widget.index);
          },
          feedback: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: const Color.fromARGB(218, 22, 20, 19),
                    width: 5,
                    style: BorderStyle.solid)),
          ),
          child: InkWell(
            onTap: () {
              context.read<BlockController>().changeCurrentId(widget.index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8.0),
                border:
                    context.read<BlockController>().currentSelectedWidgetId ==
                            widget.index
                        ? Border.all(
                            color: const Color.fromARGB(218, 187, 48, 24),
                            width: 5,
                            style: BorderStyle.solid)
                        : null,
              ),
              width: width,
              height: height,
              child: widget.child,
            ),
          ),
        ));
  }
}
