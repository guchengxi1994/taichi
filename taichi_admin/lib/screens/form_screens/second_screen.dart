// ignore_for_file: prefer_typing_uninitialized_variables

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
import 'package:taichi_admin/widgets/form_2.dart' deferred as form2;
import 'package:taichi_admin/widgets/future_builder.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ScrollController controller = ScrollController();
  var loadFormLib;

  @override
  void initState() {
    super.initState();
    loadFormLib = form2.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      controller: controller,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureLoaderWidget(
              builder: (context) => form2.DetailedInfoWidget(),
              loadWidgetFuture: loadFormLib),
          const SizedBox(
            height: 40,
          ),
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
