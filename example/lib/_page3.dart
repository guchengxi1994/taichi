/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-24 21:11:04
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-24 21:20:05
 */

import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TaichiOverlay.simple(
        isLoading,
        Scaffold(
          appBar: AppBar(
              leading: IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
          body: SizedBox(
            height: 100,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
                Future.delayed(const Duration(milliseconds: 2000))
                    .then((value) {
                  setState(() {
                    isLoading = !isLoading;
                  });
                });
              },
              child: const Text("change state"),
            ),
          ),
        ));
  }
}
