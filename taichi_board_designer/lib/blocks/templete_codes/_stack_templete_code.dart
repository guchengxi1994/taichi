/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-19 19:03:30
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-19 20:10:55
 */
// ignore: unused_import
import 'package:flutter/material.dart';

/*
  使用 {name} 替换 class 的名字，
  由于是 Stack, 所以只要关注children的绝对定位即可
*/

const String stackStatelessTempleteCode = """

class {name} extends StatelessWidget {
  const {name}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [{children}],
    );
  }
}
""";

const String stackStatelessTempleteCodeWithAppbar = """

class {name} extends StatelessWidget {
  const {name}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight({appbarHeight}),
        child: AppBar(),
      ),
      body:Stack(
        children: [{children}],
      ),
    );
  }
}

""";
