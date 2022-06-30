// ignore_for_file: avoid_unnecessary_containers

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
import 'package:taichi_accessible_widget/access_controller.dart';
import 'package:taichi_accessible_widget/access_stateless_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("[page name]:${ModalRoute.of(context)?.settings.name}");
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            tooltip: "switch user",
            onPressed: () {
              if (context.read<AccessController>().role == "admin") {
                context.read<AccessController>().changeRole("test user");
              } else {
                context.read<AccessController>().changeRole("admin");
              }
            },
            icon: const Icon(Icons.change_circle))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AccessStatelessWidget(
              widgetName: 'CenterText',
              child: const Text("center"),
            ),
            AccessStatelessWidget(
              widgetName: 'ebutton',
              child: ElevatedButton(
                  onPressed: () {
                    debugPrint("this button can be clicked");
                  },
                  child: const Text("click")),
            )
          ],
        ),
      ),
    );
  }
}
