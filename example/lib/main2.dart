// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 13:11:42
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-06 21:10:18
 */
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:taichi/src/fit/taichi_fitness.dart';
import 'package:provider/provider.dart';

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
      builder: TaichiFitnessUtil.rootBuilder(onlyOnMobiles: false),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaichiFitnessUtil.init(context);

    debugPrint(" >>>>>>>>>>>>> [ rebuild ] <<<<<<<<<<<<< ");

    return Scaffold(
      body: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage2()));
              },
              child: Container(
                color: Colors.amber,
                height: 300.h,
                width: 300.w,
                child: Text(
                  "这是一个测试页面",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page4()));
              },
              child: Container(
                color: Colors.red,
                height: 300.h,
                width: 300.w,
                child: Text(
                  "这是一个测试页面",
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ],
      ),
    );
  }
}

class MainPage2 extends StatelessWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close),
      )),
      body: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Page3()));
          },
          child: Container(
            color: Colors.red,
            width: 180.w,
            height: 320.h,
            child: Text(
              "这是一个测试页面2",
              style: TextStyle(fontSize: 20.sp),
            ),
          )),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(" >>>>>>>>>>>>> [ page3 rebuild ] <<<<<<<<<<<<< ");
    return ChangeNotifierProvider(
      create: (_) => CountController(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          )),
          body: Column(
            children: [
              Text("${context.watch<CountController>().count}"),
              Container(
                color: Colors.amber,
                height: 300.w,
                width: 300.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CountController>().increment();
                  },
                  child: Text("click"))
            ],
          ),
        );
      },
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close),
      )),
      body: Column(
        children: [
          TextWidget(),
          Container(
            color: Colors.amber,
            height: 300.w,
            width: 300.h,
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CountController(),
        builder: (context, _) {
          return Container(
            child: Column(
              children: [
                Text("${context.watch<CountController>().count}"),
                ElevatedButton(
                    onPressed: () {
                      context.read<CountController>().increment();
                    },
                    child: Text("click"))
              ],
            ),
          );
        });
  }
}

class CountController extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
