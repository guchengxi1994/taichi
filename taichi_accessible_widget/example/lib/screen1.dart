// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 20:24:17
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 20:46:45
 */
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:taichi_accessible_widget/lib.dart';

import 'routers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:yaml/yaml.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late Map<String, String> res = {};

  @override
  void initState() {
    super.initState();
  }

  Future loadFile() async {
    String data = await rootBundle.loadString("assets/role.yaml");
    var doc = loadYaml(data);
    debugPrint(doc.runtimeType.toString());
    debugPrint(json.encode(doc));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("[page name]:${ModalRoute.of(context)?.settings.name}");
    debugPrint("provider:${context.watch<AccessController>()}");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text("跳转"),
            onPressed: () {
              Navigator.of(context).pushNamed(Routers.page2);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AbsorbPointer(
            child: Opacity(
              opacity: 0.5,
              child: ElevatedButton(
                child: const Text("测试"),
                onPressed: () {
                  debugPrint("还是可以操作这个按钮");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
