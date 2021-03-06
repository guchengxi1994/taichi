import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taichi_china_map/lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChinaMap(
            mapScale: 1,
            showNames: false,
            onClick: (s) {
              debugPrint("[s]:$s");
              Fluttertoast.showToast(msg: s ?? "");
            },
            mapColor: const {
              "北京": Colors.red,
              "江苏": Colors.blue,
              "上海": Colors.green,
              "四川": Colors.orange,
              "安徽": Colors.cyanAccent
            },
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: ProvinceMapTest(),
    // );
  }
}
