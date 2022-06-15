// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 17:09:20
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 19:30:31
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_admin/app_style.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import 'side_menu_header.dart' deferred as sidemenuheader;
import 'side_menu_body.dart' deferred as sidemenubody;

import 'package:taichi_admin/utils/common.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var loadHeaderFuture;
  var loadBodyFuture;

  @override
  void initState() {
    super.initState();
    loadHeaderFuture = sidemenuheader.loadLibrary();
    loadBodyFuture = sidemenubody.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<MenuController>().isExpanded) {
      return Container(
        // padding: const EdgeInsets.all(10),
        width: 300,
        color: AppStyle.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureLoaderWidget(
                builder: (context) => sidemenuheader.SideMenuHeader(
                      type: widget.type,
                    ),
                loadWidgetFuture: loadHeaderFuture),
            FutureLoaderWidget(
                builder: (context) => sidemenubody.SideMenuBody(
                      type: widget.type,
                    ),
                loadWidgetFuture: loadBodyFuture)
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(10),
        width: 50,
        color: AppStyle.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            FutureLoaderWidget(
                builder: (context) => sidemenuheader.SideMenuHeader(
                      type: widget.type,
                    ),
                loadWidgetFuture: loadHeaderFuture),
            FutureLoaderWidget(
                builder: (context) => sidemenubody.SideMenuBody(
                      type: widget.type,
                    ),
                loadWidgetFuture: loadBodyFuture)
          ],
        ),
      );
    }
  }
}
