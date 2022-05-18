// ignore_for_file: prefer_const_constructors

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-24 18:56:39
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-24 21:18:41
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
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Widget body;

  @override
  void initState() {
    super.initState();
    body = TaichiGroupChoose.simple(
        [Text("1"), Text("2")], [Text("3"), Text("4")]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [body, ElevatedButton(onPressed: () {}, child: Text("test"))],
      ),
    );
  }
}
