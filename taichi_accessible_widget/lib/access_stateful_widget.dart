// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_accessible_widget/access_model.dart';
import 'package:taichi_valuate/valuate.dart';

import 'access_controller.dart';

/// it is recommended to use [AccessStatefulWidget]
class AccessStatefulWidget extends StatefulWidget {
  const AccessStatefulWidget(
      {Key? key, required this.child, required this.widgetName})
      : super(key: key);
  final Widget child;
  final String widgetName;

  @override
  State<AccessStatefulWidget> createState() => _AccessStatefulWidgetState();
}

class _AccessStatefulWidgetState extends State<AccessStatefulWidget> {
  late Rules rules;
  late String? rule = null;

  final RegExp rv = RegExp("(visible[^&|]*)");
  final RegExp ra = RegExp("(accessible[^&|]*)");
  late String pageRole = "";

  Widget buildContent() {
    pageRole = context.watch<AccessController>().role;
    if (rules.resources!.isEmpty && rules.role == "") {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (rule == null) {
      return const Center(
        child: Text(
          "Build widgets with AccessStatelessWidget error because rule is null,please check",
          maxLines: null,
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    String? sv = rv.allMatches(rule!).map((e) => e.group(0)).toList().first;
    String? sa = ra.allMatches(rule!).map((e) => e.group(0)).toList().first;

    if (sv == null || sa == null) {
      return const Center(
        child: Text(
          "Build widgets with AccessStatelessWidget error because rule is not completed,please check",
          maxLines: null,
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    bool? b1 =
        BooleanQuatenionOperation(expression: sv.replaceAll("visible", "true"))
            .getResult();

    bool? b2 = BooleanQuatenionOperation(
            expression: sa.replaceAll("accessible", "true"))
        .getResult();

    if (b1 == null || b2 == null) {
      return const Center(
        child: Text(
          "Build widgets with AccessStatelessWidget error because rule is not correct,please check",
          maxLines: null,
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    if (b1 == true && b2 == true) {
      return widget.child;
    } else if (b1 == true && b2 == false) {
      return AbsorbPointer(
          child: Opacity(
        opacity: 0.7,
        child: widget.child,
      ));
    } else {
      return Visibility(
        visible: false,
        child: widget.child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /// first init
    if (rule == null || pageRole != context.watch<AccessController>().role) {
      rules = context.watch<AccessController>().rules;
      rule = rules.grep(
          ModalRoute.of(context)?.settings.name ?? "", widget.widgetName);
    }

    return buildContent();
  }
}
