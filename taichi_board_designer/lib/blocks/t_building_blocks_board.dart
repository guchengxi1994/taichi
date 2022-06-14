/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-21 20:47:49
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart' show TaichiOverlay, TaichiGraph;

import '_custom_floating_action_button_loation.dart';
import 'providers/_right_side_widget_controller.dart';
import 'tools/_code_gen.dart';
import 'providers/_main_block_controller.dart';
import '_draggable_widget.dart';
import 'entity/_constants.dart';
import 'entity/_enums.dart';
import '_right_side.dart';
import 'tools/_save_file_on_desktop.dart'
    if (dart.library.html) 'tools/_save_file_on_web.dart';
import 'tree_view_paint/_tree_view.dart';
// ignore: implementation_imports
import 'package:taichi/src/UI/toast_mixin/t_toast_mixin.dart';

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
          floatingActionButton:
              context.watch<BlockController>().boardType == BoardType.custom
                  ? FloatingActionButton.extended(
                      onPressed: () {
                        if (context
                                .read<BlockController>()
                                .currentSelectedWidgetId !=
                            -1) {
                          context
                              .read<RightSideWidgetController>()
                              .changeWidgetStatus();
                        } else {
                          showCustomToast("请先选择组件");
                        }
                      },
                      label: context.watch<RightSideWidgetController>().isChange
                          ? const Text("普通样式修改")
                          : const Text("详细样式修改"),
                      icon: const Icon(Icons.change_circle),
                    )
                  : null,
          floatingActionButtonLocation: CustomFloatingActionButtonLocation(
              FloatingActionButtonLocation.endFloat, -widgetWidth / 6, -50),
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
                  InkWell(
                    onTap: () async {
                      var result = context.read<BlockController>().boardType;
                      var res = await showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: ((context, setState) {
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
                      debugPrint(sortWidgetList(context.read<BlockController>())
                          .toString());
                      var controller = context.read<BlockController>();

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
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
                    child: context.watch<BlockController>().boardType !=
                            BoardType.custom
                        ? Stack(
                            children: context.watch<BlockController>().widgets,
                          )
                        : Card(
                            margin: const EdgeInsets.all(5),
                            shadowColor:
                                const Color.fromARGB(255, 204, 148, 148),
                            elevation: 20,
                            child: Stack(
                              children:
                                  context.watch<BlockController>().widgets,
                            ),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BlockController(),
        ),
        ChangeNotifierProvider(create: (_) => RightSideWidgetController()),
      ],
      builder: (context, _) {
        return _TaichiBlocksBoard();
      },
    );
  }
}
