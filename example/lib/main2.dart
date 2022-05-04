// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 13:11:42
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-04 18:29:35
 */
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      builder: TaichiFitnessUtil.rootBuilder(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaichiFitnessUtil.init(context);
    return Scaffold(
      body: Container(
          child: Container(
        color: Colors.amber,
        // width: 300.setWidth(context),
        // height: 300.setHeight(context),
        width: 300.w,
        height: 300.h,
        child: Text("这是一个测试页面"),
      )),
    );
  }
}
