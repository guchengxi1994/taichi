/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-18 22:38:38
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_drag_controller.dart';
import '_draggable_widget.dart';
import '_constants.dart';
import '_right_side_widget.dart';
import 'tools/_save_file_on_desktop.dart'
    if (dart.library.html) 'tools/_save_file_on_web.dart';

/// 绘图板
///
/// 使用 ```Row``` 和 ```Expand``` 组成，包括左中右三个区域，
/// 比例为 1：4：1
class _TaichiBlocksBoard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _TaichiBlocksBoard({Key? key}) : super(key: key);

  @override
  State<_TaichiBlocksBoard> createState() => _TaichiBlocksBoardState();
}

class _TaichiBlocksBoardState extends State<_TaichiBlocksBoard> {
  late Color sideColor = Colors.grey[200]!;
  final TextEditingController widthTextController = TextEditingController();
  final TextEditingController heightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;

    /// 每一次重绘就把新的尺寸传到```controller``` 里存起来
    context.read<BlockController>().changeSize(widgetWidth, widgetHeight);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(BlockConstants.appbarHeight),
        child: AppBar(
          elevation: 0,
          title: const Text("Taichi board"),
          centerTitle: true,
          actions: [
            IconButton(
                tooltip: "刷新",
                onPressed: () {
                  context.read<BlockController>().changeCurrentId(-1);
                },
                icon: const Icon(
                  Icons.refresh,
                )),
            IconButton(
                tooltip: "生成",
                onPressed: () {
                  List<int> list = 'hello'.codeUnits;
                  saveFile(bytes: list, downloadName: "test.dart");
                },
                icon: const Icon(
                  Icons.create,
                )),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: sideColor,
                height: widgetHeight,
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: BlockConstants.supportedTypes
                      .map((e) => Blocks(
                            widgetName: e,
                          ))
                      .toList(),
                ),
              )),
          const Divider(
            thickness: 2,
          ),
          Expanded(
              flex: 4,
              child: SizedBox(
                height: widgetHeight,
                child: Stack(
                  children: context.watch<BlockController>().widgets,
                ),
              )),
          const Divider(
            thickness: 2,
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: sideColor,
                height: widgetHeight,
                child: SingleChildScrollView(
                    key: UniqueKey(),
                    child: RightSideWidget(
                      key: context.read<BlockController>().globalRightSideKey,
                    )),
              )),
        ],
      ),
    );
  }
}

class TaichiBlocksBoard extends StatelessWidget {
  const TaichiBlocksBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlockController(),
      builder: (context, _) {
        return _TaichiBlocksBoard();
      },
    );
  }
}
