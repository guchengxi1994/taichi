// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 11:37:21
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 19:26:14
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'package:taichi_admin/utils/common.dart';

import 'dashboard.dart' deferred as dashboard;
import '../widgets/future_builder.dart';
import '../widgets/side_menu.dart' deferred as sidemenu;
import '../widgets/appbar.dart' deferred as appbar;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var loadDashboardLib;
  var loadSidemenuLib;
  var loadAppbarLib;

  @override
  void initState() {
    super.initState();
    loadDashboardLib = dashboard.loadLibrary();
    loadSidemenuLib = sidemenu.loadLibrary();
    loadAppbarLib = appbar.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ScreenTypeUtils.isDesktop(context))
          Material(
            child: FutureLoaderWidget(
              loadWidgetFuture: loadSidemenuLib,
              builder: (context) => sidemenu.SideMenu(
                  type: ScreenTypeUtils.getScreenType(context)),
            ),
          ),
        Expanded(
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: FutureLoaderWidget(
                      loadWidgetFuture: loadAppbarLib,
                      builder: (context) => appbar.MainScreenAppbar(
                            type: ScreenTypeUtils.getScreenType(context),
                          )),
                ),
                key: context.read<MenuController>().scaffoldKey,
                drawer: FutureLoaderWidget(
                  loadWidgetFuture: loadSidemenuLib,
                  builder: (context) => sidemenu.SideMenu(
                      type: ScreenTypeUtils.getScreenType(context)),
                ),
                body: FutureLoaderWidget(
                  loadWidgetFuture: loadDashboardLib,
                  builder: (context) => dashboard.DashboardScreen(
                      type: ScreenTypeUtils.getScreenType(context)),
                ))),
      ],
    );
  }
}