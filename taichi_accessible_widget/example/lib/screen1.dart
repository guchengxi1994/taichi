/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 20:24:17
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 20:46:45
 */
import 'routers.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("[page name]:${ModalRoute.of(context)?.settings.name}");
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
