// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 13:11:42
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-03 21:26:13
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
      builder: TaichiFitness.init(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
        color: Colors.amber,
        width: 300.w(context: context),
        height: 300.h(context: context),
        child: Text("这是一个测试页面"),
      )),
    );
  }
}
