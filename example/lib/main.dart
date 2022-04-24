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

import '_page2.dart';
import '_page3.dart';

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
  @override
  Widget build(BuildContext context) {
    TaichiGraphStyle style = TaichiGraphStyle(
      color1: Colors.amber,
      color2: Colors.indigo,
      dotFactor: 0.15,
      dotColor1: Colors.brown,
      dotColor2: Colors.deepOrange,
      size: 400,
      angle: 45,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Simple:",
              style: TextStyle(fontSize: 20),
            ),
            TaichiGraph.simple(size: 300),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Custom:",
              style: TextStyle(fontSize: 20),
            ),
            TaichiGraph.custom(
              size: 300,
              color1: Colors.amber,
              color2: Colors.indigo,
              angle: 90,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "FromStyle:",
              style: TextStyle(fontSize: 20),
            ),
            TaichiGraph.fromStyle(style),
            const SizedBox(
              height: 50,
            ),
            // TaichiAutoRotateGraph.simple(size: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
                child: const Text("page2")),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page3()));
                },
                child: const Text("page3")),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
