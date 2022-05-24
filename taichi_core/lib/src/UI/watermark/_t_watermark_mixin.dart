import 'package:flutter/material.dart';

/// a simple example for watermark with ```mixin```
mixin TaichiWatermarkMixin<T extends StatefulWidget> on State<T> {
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      OverlayState? overlayState = Overlay.of(context);
      _overlayEntry = OverlayEntry(builder: (context) {
        return const Center(
          child: Text(
            "Taichi",
            style: TextStyle(decoration: TextDecoration.none),
          ),
        );
      });

      overlayState?.insert(_overlayEntry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: watermarkBuild(context),
    );
  }

  watermarkBuild(BuildContext context) {}
}
