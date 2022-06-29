/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 20:20:32
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 20:38:16
 */
import 'package:access_widget_example/routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
