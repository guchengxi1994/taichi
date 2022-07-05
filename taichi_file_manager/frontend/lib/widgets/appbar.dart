import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/app_style.dart';
import 'package:taichi_file_manager/controllers/file_tree_controller.dart';
import 'package:taichi_file_manager/utils/common.dart';

import '../models/my_tree_node.dart';

class MainScreenAppbar extends StatelessWidget {
  const MainScreenAppbar({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: type != ScreenType.desktop,
      backgroundColor: AppStyle.lightBlue,
      title: Text(context.watch<FileTreeController>().currentTreeNodeName),
      centerTitle: false,
      elevation: type == ScreenType.mobile ? 4 : 0,
      // actions: buildAppbarActions(),
      actions: [
        IconButton(
            tooltip: "报告bug",
            onPressed: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return UnconstrainedBox(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Dialog(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: SelectableText(
                                      jsonEncode(context
                                          .read<FileTreeController>()
                                          .structure!
                                          .toJson()),
                                      maxLines: null,
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(0);
                                      },
                                      child: const Text("取消")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(1);
                                      },
                                      child: const Text("确定")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.bug_report)),
        IconButton(
            tooltip: "在此处添加一个逻辑目录",
            onPressed: () {},
            icon: const Icon(Icons.add_box)),
        IconButton(
            tooltip: "上传一个文件",
            onPressed: () {
              debugPrint(
                  "[controller ]: ${json.encode(flatten(context.read<FileTreeController>().structure!).files[1].toJson())}");
            },
            icon: const Icon(Icons.add)),
        IconButton(
            tooltip: "同步数据", onPressed: () {}, icon: const Icon(Icons.sync)),
      ],
    );
  }
}
