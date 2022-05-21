/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-21 14:47:10
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/taichi/taichi.dart'
    show TaichiOverlay, TaichiGraph;

import '../UI/toast_mixin/t_toast_mixin.dart';
import '_code_gen.dart';
import '_block_controller.dart';
import '_draggable_widget.dart';
import '_constants.dart';
import '_right_side_widget.dart';
import 'tools/_save_file_on_desktop.dart'
    if (dart.library.html) 'tools/_save_file_on_web.dart';
import 'tree_view_paint/_tree_view.dart';

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

class _TaichiBlocksBoardState extends State<_TaichiBlocksBoard>
    with TaichiToastMixin {
  late Color sideColor = Colors.grey[200]!;
  final TextEditingController widthTextController = TextEditingController();
  final TextEditingController heightTextController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;

    /// 每一次重绘就把新的尺寸传到```controller``` 里存起来
    context.read<BlockController>().changeSize(widgetWidth, widgetHeight);

    return TaichiOverlay.simple(
        isLoading: isLoading,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(BlockConstants.appbarHeight),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TaichiGraph.simple(size: 40),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Taichi board",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    tooltip: "功能测试按钮",
                    onPressed: () {
                      debugPrint(sortWidgetList(context.read<BlockController>())
                          .toString());
                      var controller = context.read<BlockController>();

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return TreeView(controller: controller);
                      })));

                      // setState(() {
                      //   isLoading = true;
                      // });
                      // debugPrint(sortWidgetList(context.read<BlockController>())
                      //     .toString());
                      // setState(() {
                      //   isLoading = false;
                      // });
                    },
                    icon: const Icon(
                      Icons.functions,
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
                    onPressed: () {
                      showUnfinishedFeatureToast();
                    },
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
                      var s = codeGenerator(
                          context.read<BlockController>(), "test");

                      List<int> list = s.codeUnits;
                      saveFile(bytes: list, downloadName: "test.dart");
                    },
                    icon: const Icon(
                      Icons.create,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          body: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: widgetHeight,
                    color: sideColor,
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: BlockConstants.supportedTypes
                            .map((e) => Blocks(
                                  widgetName: e,
                                ))
                            .toList(),
                      ),
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
                    padding: const EdgeInsets.all(5),
                    color: sideColor,
                    height: widgetHeight,
                    child: RightSideWidget(
                      key: context.read<BlockController>().globalRightSideKey,
                    ),
                  )),
            ],
          ),
        ));
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
