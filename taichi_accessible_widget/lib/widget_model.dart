import 'package:flutter/material.dart';

class WidgetModel {
  bool accessible;
  bool visible;
  Widget child;
  String widgetName;
  WidgetModel(
      {required this.accessible,
      required this.visible,
      required this.child,
      required this.widgetName});

  @override
  bool operator ==(Object other) {
    if (other is! WidgetModel) {
      return false;
    }

    return other.widgetName == widgetName;
  }

  @override
  int get hashCode => widgetName.hashCode;
}

class PageModel {
  List<WidgetModel> children;
  String pageName;
  PageModel({required this.children, required this.pageName});
}
