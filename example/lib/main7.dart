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
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => EventController(),
      )
    ],
    child: MyApp(),
  ));
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

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MonthView(
        controller: context.read<EventController>(),
        onCellTap: (events, date) {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return SubPage(
              date: date,
            );
          })));
        },
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  const SubPage({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DayView(
        initialDay: date,
      ),
    );
  }
}
