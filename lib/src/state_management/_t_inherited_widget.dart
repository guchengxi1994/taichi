// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:taichi/src/utils/taichi_utils.dart';

// ignore: must_be_immutable
class YinYangInheritedWidget<T> extends InheritedWidget {
  const YinYangInheritedWidget(
      {Key? key, required Widget child, required this.notifier})
      : super(key: key, child: child);

  final T? notifier;

  @override
  bool updateShouldNotify(covariant YinYangInheritedWidget oldWidget) {
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

/// following https://book.flutterchina.club/chapter7/provider.html#_7-3-2-%E4%BC%98%E5%8C%96
@VerInfo(className: "YinYang", code: "0.0.0", info: "error")
class TaichiYang<T extends ChangeNotifier> extends StatefulWidget {
  const TaichiYang({Key? key, this.builder, required this.notifier, this.child})
      : assert((child == null && builder == null) == false),
        super(key: key);

  final T notifier;
  final Widget? child;

  //方便子树中的widget获取共享数据
  static T? of<T>(BuildContext context, {bool listen = true}) {
    YinYangInheritedWidget? inheritedWidget;
    inheritedWidget = listen
        ? context
            .dependOnInheritedWidgetOfExactType<YinYangInheritedWidget<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<
                YinYangInheritedWidget<T>>()
            ?.widget as YinYangInheritedWidget<T>;

    return inheritedWidget?.notifier;
  }

  final Widget Function(BuildContext context, T value)? builder;

  @override
  _TaichiYangState<T> createState() => _TaichiYangState<T>();
}

class _TaichiYangState<T extends ChangeNotifier> extends State<TaichiYang<T>> {
  @override
  void initState() {
    widget.notifier.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.notifier.removeListener(update);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TaichiYang<T> oldWidget) {
    if (widget.notifier != oldWidget.notifier) {
      oldWidget.notifier.removeListener(update);
      widget.notifier.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return YinYangInheritedWidget<T>(
          notifier: widget.notifier, child: widget.child!);
    } else {
      return widget.builder!(context, widget.notifier);
    }
  }
}

extension StateManagement on BuildContext {
  /// 阴, for statelesswidget
  T? yin<T>() {
    return TaichiYin.of<T>(this);
  }

  /// 阳，for statefulwidget
  T? yang<T>() {
    return TaichiYang.of<T>(this);
  }
}
