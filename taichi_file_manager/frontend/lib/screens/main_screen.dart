// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/app_style.dart';
import 'package:taichi_file_manager/controllers/menu_controller.dart';

import '../utils/common.dart';
import '../widgets/future_builder.dart';
import '../widgets/sidemenu.dart' deferred as sidemenu;
import '../widgets/appbar.dart' deferred as appbar;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var loadSidemenuLib;
  var loadAppbarLib;

  @override
  void initState() {
    super.initState();
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
          body: const Center(child: Text("body")),
        ))
      ],
    );
  }
}
