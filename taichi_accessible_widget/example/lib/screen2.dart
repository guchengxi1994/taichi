/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 20:28:04
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 20:28:04
 */
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("[page name]:${ModalRoute.of(context)?.settings.name}");
    return Container();
  }
}
