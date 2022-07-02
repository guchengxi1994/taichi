// ignore_for_file: must_be_immutable

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:41:53
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-07-02 10:20:20
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_valuate/valuate.dart';
import 'package:tuple/tuple.dart';

import 'access_controller.dart';

class AccessStatelessWidget extends StatelessWidget {
  AccessStatelessWidget(
      {Key? key,
      required this.child,
      required this.widgetName,
      this.onAccessDenied})
      : super(key: key);
  Widget child;
  String widgetName;
  Widget? onAccessDenied;

  @override
  Widget build(BuildContext context) {
    String roleName = context.watch<AccessController>().role;
    String pageName = ModalRoute.of(context)?.settings.name ?? "";
    Tuple4<int, String?, bool?, bool?> ruleTuple = context
        .watch<AccessController>()
        .getRule(roleName.hashCode + pageName.hashCode + widgetName.hashCode);

    String? rule = "";
    bool? b1;
    bool? b2;

    if (ruleTuple.item2 == null) {
      final rules = context.watch<AccessController>().rules;
      if (rules.resources!.isEmpty && rules.role == "") {
        if (onAccessDenied != null) {
          return onAccessDenied!;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      rule = rules.grep(pageName, widgetName);

      if (rule == null) {
        return const Center(
          child: Text(
            "Build widgets with AccessStatelessWidget error because rule is null,please check",
            maxLines: null,
            style: TextStyle(color: Colors.red),
          ),
        );
      }

      final RegExp rv = RegExp("(visible[^&|]*)");
      final RegExp ra = RegExp("(accessible[^&|]*)");

      String? sv = rv.allMatches(rule).map((e) => e.group(0)).toList().first;
      String? sa = ra.allMatches(rule).map((e) => e.group(0)).toList().first;

      if (sv == null || sa == null) {
        return const Center(
          child: Text(
            "Build widgets with AccessStatelessWidget error because rule is not completed,please check",
            maxLines: null,
            style: TextStyle(color: Colors.red),
          ),
        );
      }

      b1 = BooleanQuatenionOperation(
              expression: sv.replaceAll("visible", "true"))
          .getResult();

      b2 = BooleanQuatenionOperation(
              expression: sa.replaceAll("accessible", "true"))
          .getResult();

      context.read<AccessController>().addRule(
          roleName.hashCode + pageName.hashCode + widgetName.hashCode,
          rule,
          b1,
          b2);
    } else {
      b1 = ruleTuple.item3;
      b2 = ruleTuple.item4;
    }

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
      return child;
    } else if (b1 == true && b2 == false) {
      return AbsorbPointer(
          child: Opacity(
        opacity: 0.7,
        child: child,
      ));
    } else {
      return Visibility(
        visible: false,
        child: child,
      );
    }
  }
}
