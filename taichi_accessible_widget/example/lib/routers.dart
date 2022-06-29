/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 20:29:50
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 20:34:33
 */

import 'screen1.dart';
import 'screen2.dart';
import 'package:flutter/material.dart';

class Routers {
  static const page1 = "/page1";
  static const page2 = "/page2";

  static final Map<String, WidgetBuilder> routers = {
    page1: (context) => const Screen1(),
    page2: (context) => const Screen2(),
  };
}
