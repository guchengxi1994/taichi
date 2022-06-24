/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-18 19:18:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-04 21:57:52
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart' show TaichiOverlay;

import '_custom_floating_action_button_loation.dart';
import 'entity/_constants.dart';
import 'providers/_right_side_widget_controller.dart';
import 'providers/_main_block_controller.dart';
import 'entity/_enums.dart';
import '_right_side.dart' deferred as right;
import '_left_side.dart' deferred as left;
import '_middle.dart' deferred as middle;
import '_appbar.dart' deferred as appbar;

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

  // ignore: prefer_typing_uninitialized_variables
  var futureLoadRight;
  // ignore: prefer_typing_uninitialized_variables
  var futureLoadLeft;
  // ignore: prefer_typing_uninitialized_variables
  var futureLoadMiddle;
  // ignore: prefer_typing_uninitialized_variables
  var futureLoadAppbar;

  @override
  void initState() {
    super.initState();
    futureLoadRight = right.loadLibrary();
    futureLoadLeft = left.loadLibrary();
    futureLoadMiddle = middle.loadLibrary();
    futureLoadAppbar = appbar.loadLibrary();
  }

  Widget? buildFloatingActionButton() {
    return context.watch<BlockController>().boardType == BoardType.custom
        ? FloatingActionButton.extended(
            onPressed: () {
              if (context.read<BlockController>().currentSelectedWidgetId !=
                  -1) {
                context.read<RightSideWidgetController>().changeWidgetStatus();
              } else {
                showCustomToast("请先选择组件");
              }
            },
            label: context.watch<RightSideWidgetController>().isChange
                ? const Text("普通样式修改")
                : const Text("详细样式修改"),
            icon: const Icon(Icons.change_circle),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;

    /// 每一次重绘就把新的尺寸传到```controller``` 里存起来
    context.read<BlockController>().changeSize(widgetWidth, widgetHeight);

    return TaichiOverlay.simple(
        isLoading: isLoading,
        child: Scaffold(
          floatingActionButton: buildFloatingActionButton(),
          floatingActionButtonLocation: CustomFloatingActionButtonLocation(
              FloatingActionButtonLocation.endFloat, -widgetWidth / 6, -50),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(BlockConstants.appbarHeight),
              child: FutureBuilder(
                future: futureLoadAppbar,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    return appbar.DesingerAppbar(
                      onJsonDownload: showUnfinishedFeatureToast,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
          body: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: widgetHeight,
                    color: sideColor,
                    child: FutureBuilder(
                      future: futureLoadLeft,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          return left.LeftSideWidget();
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: widgetHeight,
                    child: FutureBuilder(
                      future: futureLoadMiddle,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          return middle.MiddleWidget();
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
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
                    child: FutureBuilder(
                      future: futureLoadRight,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          return right.RightSideWidget(
                            key: context
                                .read<BlockController>()
                                .globalRightSideKey,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
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
