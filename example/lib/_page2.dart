/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-24 20:33:33
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-24 21:21:27
 */

import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      body: Center(
        child: TaichiAutoRotateGraph.simple(size: 100),
      ),
    );
  }
}
