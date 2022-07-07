/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 11:32:36
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 17:52:05
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_accessible_widget/lib.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'package:taichi_admin/routers.dart';
import 'controllers/main_page_controller.dart';

/// this is an admin templete

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("[here we go]");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuController(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccessController()
            ..initFromAsset("assets/role.yaml")
            ..changeRole("test user"),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routers.routers,
        initialRoute: Routers.splash,
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
