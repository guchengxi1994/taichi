import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart' show TaichiGraph;
import 'package:taichi_admin/app_style.dart';

import '../controllers/menu_controller.dart' as menu;
import '../utils/common.dart';
import 'dart:math' as math;

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  Widget getHeaderContent(String s) {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          TaichiGraph.simple(size: 40),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            s,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<menu.MenuController>().isExpanded) {
      return SizedBox(
        height: AppStyle.headerHeight,
        child: DrawerHeader(
          decoration: const BoxDecoration(
            color: AppStyle.lightBlue,
          ),
          child: Stack(children: [
            if (type == ScreenType.desktop)
              Positioned(
                top: 0,
                left: 0,
                child: InkWell(
                  onTap: () {
                    context.read<menu.MenuController>().changeExpansion(false);
                  },
                  child: Transform.rotate(
                    angle: math.pi / 4,
                    child: const Icon(
                      Icons.close_fullscreen,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            Center(
              child: getHeaderContent("Taichi admin"),
            )
          ]),
        ),
      );
    } else {
      return Container(
        height: AppStyle.headerHeight,
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: () {
            context.read<menu.MenuController>().changeExpansion(true);
          },
          child: Transform.rotate(
            angle: math.pi / 2,
            child: const Icon(
              Icons.expand,
              color: AppStyle.spacer,
            ),
          ),
        ),
      );
    }
  }
}
