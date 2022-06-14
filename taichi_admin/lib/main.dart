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
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'package:taichi_admin/screens/main_screen.dart';

/// this is an example

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MenuController())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}