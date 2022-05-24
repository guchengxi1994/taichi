import 'package:flutter/material.dart';

/// 这是用来给 ```taichi_board``` 使用的toast
///
/// 可以使用官方的 ```fluttertoast``` 或者
/// ```flutter_smart_dialog```

mixin TaichiToastMixin<T extends StatefulWidget> on State<T> {
  static const Duration durationTime = Duration(milliseconds: 2000);
  late OverlayEntry _overlayEntry;

  String dowmloadSucessStr = "下载成功";
  String dowmloadFailStr = "下载失败";
  String uploadFailStr = "上传失败";
  String uploadSucessStr = "上传成功";

  showUploadSucessToast() {
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return toastWidget(uploadSucessStr);
    });
    overlayState?.insert(_overlayEntry);
    Future.delayed(durationTime, () {
      _overlayEntry.remove();
    });
  }

  showUploadFailToast() {
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return toastWidget(uploadFailStr);
    });
    overlayState?.insert(_overlayEntry);
    Future.delayed(durationTime, () {
      _overlayEntry.remove();
    });
  }

  showDownloadSucessToast() {
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return toastWidget(dowmloadSucessStr);
    });
    overlayState?.insert(_overlayEntry);
    Future.delayed(durationTime, () {
      _overlayEntry.remove();
    });
  }

  showUnfinishedFeatureToast() {
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return toastWidget("尚未完成的功能 :)");
    });
    overlayState?.insert(_overlayEntry);
    Future.delayed(durationTime, () {
      _overlayEntry.remove();
    });
  }

  showDownloadFailToast() {
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return toastWidget(dowmloadFailStr);
    });
    overlayState?.insert(_overlayEntry);
    Future.delayed(durationTime, () {
      _overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return toastBuild(context);
  }

  toastBuild(BuildContext context) {}

  Widget toastWidget(String s) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Text(
          s,
          style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
