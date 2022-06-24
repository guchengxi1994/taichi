import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart' show TaichiGraph;
import 'entity/_enums.dart';
import 'providers/_main_block_controller.dart';
import 'tools/_code_gen.dart';
import 'tree_view_paint/_tree_view.dart';
import 'tools/_save_file_on_desktop.dart'
    if (dart.library.html) 'tools/_save_file_on_web.dart';

class DesingerAppbar extends StatelessWidget {
  const DesingerAppbar({Key? key, this.onJsonDownload}) : super(key: key);
  final VoidCallback? onJsonDownload;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TaichiGraph.simple(size: 40),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              var result = context.read<BlockController>().boardType;
              var res = await showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: ((context, setState) {
                      return CupertinoAlertDialog(
                        title: const Text("选择类型"),
                        content: Material(
                          color: Colors.transparent,
                          child: Column(
                            children: BoardType.values
                                .map(
                                  (e) => InkWell(
                                      onTap: () {
                                        result = e;
                                        setState(() {});
                                      },
                                      child: Text(
                                        e.toStr(),
                                        style: TextStyle(
                                            color: result == e
                                                ? Colors.red
                                                : Colors.black),
                                      )),
                                )
                                .toList(),
                          ),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.of(context).pop(0);
                              },
                              child: const Text("取消")),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.of(context).pop(1);
                              },
                              child: const Text("确定")),
                        ],
                      );
                    }));
                  });

              if (res == 1) {
                // ignore: use_build_context_synchronously
                context.read<BlockController>().changeBoardType(result);
              }
            },
            child: Text(
              "Taichi board(${context.watch<BlockController>().boardType.toStr()})",
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
            tooltip: "展示树形结构图",
            onPressed: () {
              debugPrint(
                  sortWidgetList(context.read<BlockController>()).toString());
              var controller = context.read<BlockController>();

              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return TreeView(controller: controller);
              })));
            },
            icon: const Icon(
              Icons.auto_graph,
              color: Colors.black,
            )),
        IconButton(
            tooltip: "操作回退",
            onPressed: () {
              context.read<BlockController>().undo();
            },
            icon: const Icon(
              Icons.undo,
              color: Colors.black,
            )),
        IconButton(
            tooltip: "下载json",
            // onPressed: () {
            //   // if (gloabalKey != null) {
            //   //   gloabalKey!.currentState!.showUnfinishedFeatureToast();
            //   // }
            // },
            onPressed: onJsonDownload,
            icon: const Icon(
              Icons.download,
              color: Colors.black,
            )),
        IconButton(
            tooltip: "刷新",
            onPressed: () {
              context.read<BlockController>().changeCurrentId(-1);
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            )),
        IconButton(
            tooltip: "生成",
            onPressed: () {
              var s = codeGenerator(context.read<BlockController>(), "test");

              List<int> list = s.codeUnits;
              saveFile(bytes: list, downloadName: "test.dart");
            },
            icon: const Icon(
              Icons.create,
              color: Colors.black,
            )),
      ],
    );
  }
}
