import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:taichi/src/state_management/taichi_yinyang.dart';

void main() => runApp(TaichiYin(
      notifier: Counter(),
      child: const MyApp(),
    ));

class Counter extends ChangeNotifier {
  int _count = 0; //数值计算

  int get count => _count;

  addCount() {
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(children: [
        Text(TaichiYin.of<Counter>(context)?.count.toString() ?? "未知"),
        ElevatedButton(
            onPressed: () {
              TaichiYin.of<Counter>(context)?.addCount();
            },
            child: const Text("add")),
      ])),
    );
  }
}
