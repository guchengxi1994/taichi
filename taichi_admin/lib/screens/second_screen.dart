/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-15 21:23:42
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-15 21:23:42
 */
import 'package:flutter/material.dart';

/// this is for test
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("this is a second page"),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("返回"))
        ],
      ),
    );
  }
}