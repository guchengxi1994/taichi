/// modified from https://github.com/guchengxi1994/a-cool-app/blob/dev/frontend/codind/lib/pages/module_pages/file_explore_page.dart

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/controllers/file_tree_controller.dart';
import 'package:taichi_file_manager/models/my_tree_node.dart';

import 'file_widget.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  List<Widget> renderFiles(BuildContext context, List<Object> list, int depth,
      {String? fatherPath}) {
    List<Widget> widgets = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].runtimeType == EntityFile) {
        widgets.add(FileWidget(
          tooltip: (list[i] as EntityFile).timestamp,
          index: i,
          appearance: const Icon(
            Icons.file_present,
            size: 60,
          ),
          name: (list[i] as EntityFile).name,
          onDoubleCilck: () {
            debugPrint("这里要跳转具体的文件");
          },
        ));
      } else {
        EntityFolder _entity = list[i] as EntityFolder;
        widgets.add(FileWidget(
          tooltip: "${_entity.children.length}个文件",
          index: i,
          appearance: const Icon(
            Icons.folder,
            size: 60,
          ),
          name: (list[i] as EntityFolder).name,
          onDoubleCilck: () {
            debugPrint("这里要跳转到下一层级文件夹");
            context.read<FileTreeController>().changeCurrentEntity(_entity);
            context.read<FileTreeController>().changeTreeNodeName(_entity.name);
          },
        ));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: renderFiles(
          context,
          context.watch<FileTreeController>().currentFolderContent,
          context.watch<FileTreeController>().depth),
    );
  }
}
