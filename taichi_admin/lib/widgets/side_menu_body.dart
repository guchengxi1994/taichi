// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_admin/controllers/main_page_controller.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';

import '../app_style.dart';
import '../utils/common.dart';

class SideMenuBody extends StatelessWidget {
  const SideMenuBody({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  Widget build(BuildContext context) {
    if (context.watch<MenuController>().isExpanded ||
        type != ScreenType.desktop) {
      return Column(
        children: const [
          ExpandedBodyWidget(
            icon: Icon(
              Icons.dashboard,
              color: AppStyle.spacer,
            ),
            message: "Dashboard",
            route: "/",
          ),
          ExpandedBodyWidget(
              icon: Icon(
                Icons.functions,
                color: AppStyle.spacer,
              ),
              message: "创建新用户",
              route: "/newuser"),
          ExpandedBodyWidget(
            icon: Icon(
              Icons.abc,
              color: AppStyle.spacer,
            ),
            message: "模块2",
          ),
          ExpandedBodyWidget(
            icon: Icon(
              Icons.access_alarm,
              color: AppStyle.spacer,
            ),
            message: "模块3",
          ),
          ExpandedBodyWidget(
            icon: Icon(
              Icons.adb,
              color: AppStyle.spacer,
            ),
            message: "模块4",
          ),
        ],
      );
    } else {
      return Column(
        children: const [
          UnExpandedBodyWidget(
            icon: Icon(
              Icons.dashboard,
              color: AppStyle.spacer,
            ),
            message: "Dashboard",
            route: "/",
          ),
          UnExpandedBodyWidget(
              icon: Icon(
                Icons.functions,
                color: AppStyle.spacer,
              ),
              message: "创建新用户",
              route: "/newuser"),
          UnExpandedBodyWidget(
            icon: Icon(
              Icons.abc,
              color: AppStyle.spacer,
            ),
            message: "模块2",
          ),
          UnExpandedBodyWidget(
            icon: Icon(
              Icons.access_alarm,
              color: AppStyle.spacer,
            ),
            message: "模块3",
          ),
          UnExpandedBodyWidget(
            icon: Icon(
              Icons.adb,
              color: AppStyle.spacer,
            ),
            message: "模块4",
          ),
        ],
      );
    }
  }
}

// 这是没有展开时的样式
class UnExpandedBodyWidget extends StatelessWidget {
  const UnExpandedBodyWidget(
      {Key? key,
      required this.icon,
      this.onTap,
      required this.message,
      this.route})
      : super(key: key);
  final Widget icon;
  final VoidCallback? onTap;
  final String message;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<MainPageController>().currentBodyName == message
          ? AppStyle.darkBlue
          : AppStyle.lightBlue,
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
                context
                    .read<MainPageController>()
                    .changeBodyName(message, route: route ?? "test");
              },
          child: icon,
        ),
      ),
    );
  }
}

// 这部分是展开时的样式
class ExpandedBodyWidget extends StatelessWidget {
  const ExpandedBodyWidget(
      {Key? key,
      required this.icon,
      this.onTap,
      required this.message,
      this.route})
      : super(key: key);

  final Widget icon;
  final VoidCallback? onTap;
  final String message;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<MainPageController>().currentBodyName == message
          ? AppStyle.darkBlue
          : AppStyle.lightBlue,
      child: ListTile(
        leading: icon,
        title: Text(
          message,
          style: AppStyle.menuBar,
        ),
        onTap: onTap ??
            () {
              if (context.read<MainPageController>().currentBodyName ==
                  message) {
                return;
              }
              context
                  .read<MainPageController>()
                  .changeBodyName(message, route: route ?? "test");
            },
      ),
    );
  }
}
