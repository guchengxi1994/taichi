import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_drag_controller.dart';
import 'constants.dart';

// ignore: must_be_immutable
class Blocks extends StatelessWidget {
  Blocks({Key? key, this.widgetName = "A"}) : super(key: key);
  String widgetName;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragEnd: (details) {
        debugPrint("[drag details]: ${details.offset}");
        context.read<DragController>().addWidget(
            Container(
              width: taichiDraggableWidgetSize,
              height: taichiDraggableWidgetSize,
              color: bodyWidgetInitialColor,
            ),
            details.offset);
      },
      feedback: Container(
        height: taichiDraggableWidgetSize,
        width: taichiDraggableWidgetSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bodyWidgetInitialColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          widgetName,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      child: Container(
        height: taichiDraggableWidgetSize,
        width: taichiDraggableWidgetSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: leftDragglableWidgetColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          widgetName,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
