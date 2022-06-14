// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 11:28:42
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 18:54:26
 */
import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import '../widgets/dashboard_left_part.dart' deferred as left;
import '../widgets/dashboard_right_part.dart' deferred as right;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var loadLeftFuture;
  var loadRightFuture;

  @override
  void initState() {
    super.initState();
    loadLeftFuture = left.loadLibrary();
    loadRightFuture = right.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: FutureLoaderWidget(
            builder: (context) => left.DashboardLeftPart(type: widget.type),
            loadWidgetFuture: loadLeftFuture,
          ),
        ),
        if (widget.type == ScreenType.desktop)
          Expanded(
              flex: 1,
              child: FutureLoaderWidget(
                builder: (context) =>
                    right.DashboardRightPart(type: widget.type),
                loadWidgetFuture: loadRightFuture,
              )),
      ],
    );
  }
}
