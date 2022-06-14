// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_admin/controllers/main_page_controller.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';

import '../utils/common.dart';

class SideMenuBody extends StatelessWidget {
  const SideMenuBody({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  Widget build(BuildContext context) {
    if (context.watch<MenuController>().isExpanded ||
        type != ScreenType.desktop) {
      return Column(
        children: [
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () {
              if (context.read<MainPageController>().currentBodyName ==
                  "Dashboard") {
                return;
              }
              context.read<MainPageController>().changeBodyName("Dashboard");
            },
          ),
          ListTile(
            leading: const Icon(Icons.functions),
            title: const Text("模块1"),
            onTap: () {
              if (context.read<MainPageController>().currentBodyName == "模块1") {
                return;
              }
              context.read<MainPageController>().changeBodyName("模块1");
            },
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text("模块2"),
            onTap: () {
              if (context.read<MainPageController>().currentBodyName == "模块2") {
                return;
              }
              context.read<MainPageController>().changeBodyName("模块2");
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text("模块3"),
            onTap: () {
              if (context.read<MainPageController>().currentBodyName == "模块3") {
                return;
              }
              context.read<MainPageController>().changeBodyName("模块3");
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text("模块4"),
            onTap: () {
              if (context.read<MainPageController>().currentBodyName == "模块4") {
                return;
              }
              context.read<MainPageController>().changeBodyName("模块4");
            },
          ),
        ],
      );
    } else {
      return Column(
        children: const [
          UnExpandedBodyWidget(
            icon: Icon(Icons.dashboard),
            message: "Dashboard",
          ),
          UnExpandedBodyWidget(
            icon: Icon(Icons.functions),
            message: "模块1",
          ),
          UnExpandedBodyWidget(
            icon: Icon(Icons.abc),
            message: "模块2",
          ),
          UnExpandedBodyWidget(
            icon: Icon(Icons.access_alarm),
            message: "模块3",
          ),
          UnExpandedBodyWidget(
            icon: Icon(Icons.adb),
            message: "模块4",
          ),
        ],
      );
    }
  }
}

class UnExpandedBodyWidget extends StatelessWidget {
  const UnExpandedBodyWidget(
      {Key? key, required this.icon, this.onTap, required this.message})
      : super(key: key);
  final Widget icon;
  final VoidCallback? onTap;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Tooltip(
        // padding: EdgeInsets.all(5),
        // margin: EdgeInsets.all(5),
        message: message,
        child: InkWell(
          onTap: onTap ??
              () {
                if (context.read<MainPageController>().currentBodyName ==
                    message) {
                  return;
                }
                context.read<MainPageController>().changeBodyName(message);
              },
          child: icon,
        ),
      ),
    );
  }
}
