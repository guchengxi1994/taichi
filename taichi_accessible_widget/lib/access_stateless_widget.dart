// ignore_for_file: must_be_immutable

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:41:53
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-28 22:18:31
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_valuate/valuate.dart';

import 'access_controller.dart';

class AccessStatelessWidget extends StatelessWidget {
  AccessStatelessWidget({
    Key? key,
    required this.child,
    required this.widgetName,
  }) : super(key: key);
  Widget child;
  String widgetName;

  @override
  Widget build(BuildContext context) {
    final rules = context.watch<AccessController>().rules;
    if (rules.resources!.isEmpty && rules.role == "") {
      context.watch<AccessController>().whenNotValidFunc();
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // debugPrint("[rules resources]:${rules.resources}");

    String? rule =
        rules.grep(ModalRoute.of(context)?.settings.name ?? "", widgetName);

    // debugPrint("[rule]:${rule.toString()}");

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
