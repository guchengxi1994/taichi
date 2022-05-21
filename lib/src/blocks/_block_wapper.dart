/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-21 10:50:39
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_block_controller.dart';
import '_constants.dart';
import '_operation.dart';

// ignore: must_be_immutable
class BlocksWrapperWidget extends StatefulWidget {
  BlocksWrapperWidget(
      {Key? key,
      required this.child,
      required this.index,
      required this.initialLeft,
      required this.initialTop,
      this.widgetType = "Container",
      this.ancestorIndex = 0})
      : super(key: key);
  Widget child;
  int index;
  double initialTop;
  double initialLeft;
  String widgetType;

  /// alpha + 3 版本加入 ancestor index
  ///
  /// 0 代表根节点，其余从1开始
  ///
  /// 默认是根节点。
  ///
  /// 用于绘制树形图
  int ancestorIndex;

  @override
  State<BlocksWrapperWidget> createState() => BlocksWrapperWidgetState();
}

class BlocksWrapperWidgetState extends State<BlocksWrapperWidget> {
  double width = BlockConstants.taichiDraggableWidgetSize;
  double height = BlockConstants.taichiDraggableWidgetSize;
  Color color = BlockConstants.bodyWidgetInitialColor;

  late double left;
  late double top;
  late int ancestorIndex;

  bool isVisiable = true;

  @override
  void initState() {
    super.initState();
    left = widget.initialLeft;
    top = widget.initialTop;
    ancestorIndex = widget.ancestorIndex;
  }

  void changeAncestorIndex(int index) {
    ancestorIndex = index;
    setState(() {});
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

  changeVisiable() {
    setState(() {
      isVisiable = !isVisiable;
    });
  }

  /// alpha+2 版本添加的方法
  changeState({required WidgetState current}) {
    setState(() {
      if (current.height != null) {
        height = current.height!;
      }

      if (current.width != null) {
        width = current.width!;
      }

      if (current.isVisiable != null) {
        isVisiable = current.isVisiable!;
      }

      if (current.offset != null) {
        left = current.offset!.dx;
        top = current.offset!.dy;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.widgetType == "AppBar") {
      width = MediaQuery.of(context).size.width * 2 / 3;
    }

    return Positioned(
        left: left,
        top: top,
        child: Visibility(
            visible: isVisiable,
            child: Draggable(
              onDragEnd: (details) {
                double widgetWidth =
                    context.read<BlockController>().screenWidth;

                WidgetState prev = WidgetState(offset: Offset(left, top));
                if (widget.widgetType != "AppBar") {
                  top = details.offset.dy - BlockConstants.appbarHeight;
                  left = details.offset.dx - widgetWidth / 6;
                } else {
                  top = 0;
                  left = 0;
                }

                context.read<BlockController>().changeState(
                    operationType: OperationType.moveTo,
                    current: WidgetState(offset: Offset(left, top)),
                    index: widget.index - 1, // widget id 从1开始的
                    prev: prev);

                context
                    .read<BlockController>()
                    .globalRightSideKey
                    .currentState!
                    .setState(() {});
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
                    border: context
                                .watch<BlockController>()
                                .currentSelectedWidgetId ==
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
            )));
  }
}
