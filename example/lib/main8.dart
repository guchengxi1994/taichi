// ignore_for_file: prefer_const_literals_to_create_immutables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 11:19:58
 */
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

void main() => runApp(
      const MyApp(),
    );

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(100),
                child: SimpleDatePicker(),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: DatePickerWithOverlay(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
