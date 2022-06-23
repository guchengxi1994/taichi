import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/app_style.dart';
import 'package:taichi_file_manager/controllers/file_tree_controller.dart';
import 'package:taichi_file_manager/utils/common.dart';

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
    );
  }
}
