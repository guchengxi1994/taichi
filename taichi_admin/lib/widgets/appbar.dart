/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 18:36:56
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 19:28:10
 */
import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';

class MainScreenAppbar extends StatelessWidget {
  const MainScreenAppbar({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: type != ScreenType.desktop,
      elevation: type == ScreenType.mobile ? 4 : 0,
    );
  }
}
