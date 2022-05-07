import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:taichi/src/state_management/taichi_yinyang.dart';

void main() => runApp(
      const MyApp(),
    );

class Counter2 extends ChangeNotifier {
  int _count = 0; //数值计算

  int get count => _count;

  addCount() {
    // debugPrint(">>>>>>>>>>>  [click add]");
    _count++;
    notifyListeners();
  }

  dontAddCount() {
    notifyListeners();
  }

  @override
  String toString() {
    return "[current count] $_count";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Counter2 c = Counter2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TaichiYang<Counter2>(
            notifier: Counter2(),
            child: Builder(
              builder: ((context) {
                return Scaffold(
                  body: Column(children: [
                    Text(TaichiYang.of<Counter2>(context)?.count.toString() ??
                        "未知"),
                    ElevatedButton(
                        onPressed: () {
                          debugPrint("[click button]");
                          // TaichiYang.of<Counter2>(context)?.addCount();
                          context.yang<Counter2>()?.addCount();
                        },
                        child: const Text("add")),
                    ElevatedButton(
                        onPressed: () {
                          TaichiYang.of<Counter2>(context)?.dontAddCount();
                        },
                        child: const Text("dont add")),
                  ]),
                );
              }),
            )));
  }
}
