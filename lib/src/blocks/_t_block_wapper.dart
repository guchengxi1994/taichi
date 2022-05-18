import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: must_be_immutable
class BlocksWrapperWidget extends StatefulWidget {
  BlocksWrapperWidget({Key? key, required this.child, required this.index})
      : super(key: key);
  Widget child;
  int index;

  @override
  State<BlocksWrapperWidget> createState() => _BlocksWrapperWidgetState();
}

class _BlocksWrapperWidgetState extends State<BlocksWrapperWidget> {
  double width = taichiDraggableWidgetSize;
  double height = taichiDraggableWidgetSize;
  Color color = bodyWidgetInitialColor;
  bool isSelected = false;

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
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                        blurRadius: 15.0, //阴影模糊程度
                        spreadRadius: 1.0 //阴影扩散程度
                        )
                  ]
                : null),
        width: width,
        height: height,
        child: widget.child,
      ),
    );
  }
}
