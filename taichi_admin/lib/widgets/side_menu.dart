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
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'dart:math' as math;

import 'package:taichi_admin/utils/common.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  Widget build(BuildContext context) {
    if (context.watch<MenuController>().isExpanded) {
      return Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (type == ScreenType.desktop)
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    context.read<MenuController>().changeExpansion(false);
                  },
                  child: Transform.rotate(
                    angle: math.pi / 4,
                    child: const Icon(
                      Icons.close_fullscreen,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(10),
        width: 50,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // if (type == ScreenType.desktop)
            InkWell(
              onTap: () {
                context.read<MenuController>().changeExpansion(true);
              },
              child: Transform.rotate(
                angle: math.pi / 2,
                child: const Icon(Icons.expand),
              ),
            )
          ],
        ),
      );
    }
  }
}
