/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-18 22:00:16
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_drag_controller.dart';
import '_constants.dart';

/// 左侧列表中，可拖动的小部件
///
/// 支持的小部件类型:
///
/// ```Container```
///
/// ```SizedBox```
///
/// -------
///
/// 接受的参数类型 ```String```,
/// 代表小部件的 runtimeType

// ignore: must_be_immutable
class Blocks extends StatelessWidget {
  Blocks({Key? key, this.widgetName = "A"}) : super(key: key);
  String widgetName;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragEnd: (details) {
        debugPrint("[drag details]: ${details.offset}");
        var index = context.read<BlockController>().currentIndex;
        context.read<BlockController>().addWidget(
            Container(
              width: BlockConstants.taichiDraggableWidgetSize,
              height: BlockConstants.taichiDraggableWidgetSize,
              color: BlockConstants.bodyWidgetInitialColor,
              child: Center(
                  child: Text(
                "$index. $widgetName",
                maxLines: null,
              )),
            ),
            details.offset,
            widgetName);
      },
      feedback: Container(
        height: BlockConstants.taichiDraggableWidgetSize,
        width: BlockConstants.taichiDraggableWidgetSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: BlockConstants.bodyWidgetInitialColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          widgetName,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none),
        ),
      ),
      child: InkWell(
        onLongPress: () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text("Introduction"),
                  content: Material(
                    color: Colors.transparent,
                    child: Text(introductionOfWidgets[widgetName]!),
                  ),
                  actions: [
                    CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"))
                  ],
                );
              });
        },
        child: Container(
          height: BlockConstants.taichiDraggableWidgetSize,
          width: BlockConstants.taichiDraggableWidgetSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: BlockConstants.leftDragglableWidgetColor,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            widgetName,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
