/// modified from https://github.com/guchengxi1994/a-cool-app/blob/dev/frontend/codind/lib/pages/module_pages/file_explore_page.dart

import 'package:flutter/material.dart';

const double iconSize = 100;

// ignore: must_be_immutable
class FileWidget extends StatefulWidget {
  VoidCallback? onDoubleCilck;
  Icon appearance;
  String name;
  String? tooltip;
  int index;

  FileWidget(
      {Key? key,
      required this.name,
      required this.appearance,
      this.tooltip,
      this.onDoubleCilck,
      required this.index})
      : super(key: key);

  @override
  State<FileWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  late double dx = 0;
  late double dy = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dx = (widget.index %
            (MediaQuery.of(context).size.width ~/ (iconSize + 10))) *
        iconSize;
    dy = (widget.index ~/
            (MediaQuery.of(context).size.width ~/ (iconSize + 10))) *
        iconSize;
    return Positioned(
      left: dx,
      top: dy,
      child: Container(
        color: Colors.transparent,
        height: iconSize,
        width: iconSize,
        child: InkWell(
          onDoubleTap: widget.onDoubleCilck,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Tooltip(
                padding: const EdgeInsets.all(5),
                message: widget.tooltip ?? "",
                child: widget.appearance,
              ),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}
