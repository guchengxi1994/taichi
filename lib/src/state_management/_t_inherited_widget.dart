import 'package:flutter/material.dart';
import 'package:taichi/src/utils/taichi_utils.dart';

class YinYangInheritedWidget<T> extends InheritedWidget {
  const YinYangInheritedWidget(
      {Key? key, required Widget child, required this.notifier})
      : super(key: key, child: child);

  final T? notifier;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

@VerInfo(className: "YinYang", code: "0.0.0", info: "")
// ignore: must_be_immutable
class TaichiYin<T extends ChangeNotifier> extends StatelessWidget {
  Widget child;
  T? notifier;
  TaichiYin({Key? key, required this.child, required this.notifier})
      : super(key: key);
  Element? _element;

  static T? of<T>(BuildContext context, {bool listen = true}) {
    YinYangInheritedWidget? inheritedWidget;
    inheritedWidget = ((context.getElementForInheritedWidgetOfExactType<
            YinYangInheritedWidget<T>>())
        ?.widget as YinYangInheritedWidget?);
    if (listen) {
      context.dependOnInheritedWidgetOfExactType<YinYangInheritedWidget<T>>();
    }

    return inheritedWidget?.notifier;
  }

  @override
  Widget build(BuildContext context) {
    if (_element == null) {
      _element = context as Element;
      notifier?.addListener(() {
        _element?.markNeedsBuild();
      });
    }
    return YinYangInheritedWidget<T>(notifier: notifier, child: child);
  }
}
