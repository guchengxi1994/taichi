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
import '_t_block_wapper.dart';
import 'constants.dart';

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
  void dispose() {
    widthTextController.dispose();
    heightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;

    context.read<BlockController>().changeWidth(widgetWidth);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(BlockConstants.appbarHeight),
        child: AppBar(
          elevation: 0,
          title: const Text("Taichi board"),
          centerTitle: true,
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
                  children: [Blocks()],
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
                    key: UniqueKey(), child: _buildRightSide()),
              )),
        ],
      ),
    );
  }

  Widget _buildRightSide() {
    if (context.watch<BlockController>().currentSelectedWidgetId != -1) {
      BlocksWrapperWidget w = context.read<BlockController>().currentWidget;
      GlobalKey<BlocksWrapperWidgetState> k =
          context.read<BlockController>().currentKey;

      widthTextController.text = k.currentState!.width.toString();

      heightTextController.text = k.currentState!.height.toString();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "当前主体尺寸(宽*高)\n${(MediaQuery.of(context).size.width * 0.66).ceil()}*${MediaQuery.of(context).size.height.ceil()}"),
          const SizedBox(
            height: 20,
          ),

          const Text("名称"),
          Text("${w.index} ${w.widgetType}"),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          const Text("宽度"),
          SizedBox(
            height: BlockConstants.inputHeight,
            width: 0.9 * MediaQuery.of(context).size.width / 6,
            child: TextField(
              controller: widthTextController,
              decoration: InputDecoration(
                  hintText: "${k.currentState?.width}",
                  suffix: IconButton(
                      onPressed: () {
                        try {
                          double d = double.parse(widthTextController.text);
                          if (k.currentState!.width != d) {
                            k.currentState!.setWidth(d);
                          }
                        } catch (_) {}
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ))),
            ),
          ),
          const Text("高度"),
          // Text("${k.currentState?.height}"),
          SizedBox(
            height: BlockConstants.inputHeight,
            width: 0.9 * MediaQuery.of(context).size.width / 6,
            child: TextField(
              controller: heightTextController,
              decoration: InputDecoration(
                  hintText: "${k.currentState?.height}",
                  suffix: IconButton(
                      onPressed: () {
                        try {
                          double d = double.parse(heightTextController.text);
                          if (k.currentState!.height != d) {
                            k.currentState!.setHeight(d);
                          }
                        } catch (_) {}
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ))),
            ),
          ),

          const Divider(
            thickness: 2,
            color: Colors.black,
          ),

          Text("距离左侧距离\n${k.currentState!.left.ceil()}"),
          Text("距离顶部距离\n${k.currentState!.top.ceil()}"),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "当前主体尺寸(宽*高)\n${(MediaQuery.of(context).size.width * 0.66).ceil()}*${MediaQuery.of(context).size.height.ceil()}"),
        ],
      );
    }
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
