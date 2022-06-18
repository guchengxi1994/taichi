// ignore_for_file: prefer_const_literals_to_create_immutables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 10:37:51
 */
import 'package:flutter/material.dart';
import 'package:taichi/src/UI/simple_date_picker/taichi_simple_date_picker.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(100),
              child: DatePicker(),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
