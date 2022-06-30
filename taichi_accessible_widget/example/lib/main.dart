// ignore_for_file: depend_on_referenced_packages

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 20:20:32
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 20:38:16
 */
import 'package:taichi_accessible_widget/lib.dart';

import 'routers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AccessController()
      ..initFromAsset("assets/role.yaml")
      ..changeRole("test user"),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routers.routers,
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.page1,
    );
  }
}
