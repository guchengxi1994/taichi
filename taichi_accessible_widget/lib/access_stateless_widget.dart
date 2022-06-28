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

import 'access_controller.dart';

class AccessStatelessWidget extends StatelessWidget {
  AccessStatelessWidget(
      {Key? key, this.builder, this.child, required this.widgetName})
      : assert(child != null || builder != null),
        super(key: key);
  Widget? child;
  WidgetBuilder? builder;
  String widgetName;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AccessController>();
    return Container();
  }
}
