/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-20 20:40:50
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-20 22:06:26
 */
import 'package:flutter/material.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import 'package:taichi_admin/widgets/table_widget.dart' deferred as table;

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var loadTableLib;

  @override
  void initState() {
    super.initState();
    loadTableLib = table.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: FutureLoaderWidget(
        loadWidgetFuture: loadTableLib,
        builder: (context) {
          return table.TableWidget(
            tableHeight: 500,
            tableWidth: MediaQuery.of(context).size.width,
          );
        },
      ),
    );
  }
}
