// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 11:37:21
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-20 22:00:10
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_admin/app_style.dart';
import 'package:taichi_admin/controllers/main_page_controller.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'package:taichi_admin/screens/form_screens/first_screen.dart'
    deferred as templete;
import 'package:taichi_admin/screens/reserved_screen.dart' deferred as reserved;
import 'package:taichi_admin/utils/common.dart';

import 'dashboard.dart' deferred as dashboard;
import '../widgets/future_builder.dart';
import '../widgets/side_menu.dart' deferred as sidemenu;
import '../widgets/appbar.dart' deferred as appbar;
import '../screens/table_screen.dart' deferred as tablescreen;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var loadDashboardLib;
  var loadSidemenuLib;
  var loadAppbarLib;
  var loadTempletePageLib;
  var loadReservedPageLib;
  var loadTableScreenLib;

  @override
  void initState() {
    super.initState();
    loadDashboardLib = dashboard.loadLibrary();
    loadSidemenuLib = sidemenu.loadLibrary();
    loadAppbarLib = appbar.loadLibrary();
    loadTempletePageLib = templete.loadLibrary();
    loadReservedPageLib = reserved.loadLibrary();
    loadTableScreenLib = tablescreen.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    var route = context.watch<MainPageController>().currentRoute;

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
            preferredSize: const Size.fromHeight(AppStyle.appbarHeight),
            child: FutureLoaderWidget(
                loadWidgetFuture: loadAppbarLib,
                builder: (context) => appbar.MainScreenAppbar(
                      type: ScreenTypeUtils.getScreenType(context),
                    )),
          ),
          key: context.read<MenuController>().scaffoldKey,
          drawer: FutureLoaderWidget(
            loadWidgetFuture: loadSidemenuLib,
            builder: (context) =>
                sidemenu.SideMenu(type: ScreenTypeUtils.getScreenType(context)),
          ),
          body: Builder(
            builder: (context) {
              switch (route) {
                case "/":
                  return FutureLoaderWidget(
                    loadWidgetFuture: loadDashboardLib,
                    builder: (context) => dashboard.DashboardScreen(
                        type: ScreenTypeUtils.getScreenType(context)),
                  );
                case "/newuser":
                  return FutureLoaderWidget(
                      builder: (context) => templete.TempleteScreen(),
                      loadWidgetFuture: loadTempletePageLib);
                case "/table":
                  return FutureLoaderWidget(
                      builder: (context) => tablescreen.TableScreen(),
                      loadWidgetFuture: loadTableScreenLib);
                default:
                  return FutureLoaderWidget(
                      builder: (context) => reserved.ReservedScreen(),
                      loadWidgetFuture: loadReservedPageLib);
              }
            },
          ),
        ))
      ],
    );
  }
}
