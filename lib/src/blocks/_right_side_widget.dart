import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/blocks/_operation.dart';

import '_drag_controller.dart';
import '_t_block_wapper.dart';
import '_constants.dart';

class RightSideWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RightSideWidget({Key? key}) : super(key: key);

  @override
  State<RightSideWidget> createState() => _RightSideWidgetState();
}

class _RightSideWidgetState extends State<RightSideWidget> {
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
              "当前主体尺寸(宽*高)\n${(context.watch<BlockController>().screenWidth * 0.66).ceil()}*${context.watch<BlockController>().screenHeight.ceil()}"),
          const SizedBox(
            height: 20,
          ),

          const Text("名称"),
          Text("${w.index} ${w.widgetType}"),
          Container(
            height: 5,
            color: Colors.black,
          ),
          const Text("宽度"),
          SizedBox(
            height: BlockConstants.inputHeight,
            width: 0.9 * context.watch<BlockController>().screenWidth / 6,
            child: TextField(
              controller: widthTextController,
              decoration: InputDecoration(
                  hintText: "${k.currentState?.width}",
                  suffix: IconButton(
                      onPressed: () {
                        try {
                          double d = double.parse(widthTextController.text);
                          if (k.currentState!.width != d) {
                            // k.currentState!.setWidth(d);
                            context.read<BlockController>().changeState(
                                current: WidgetState(width: d),
                                prev: WidgetState(
                                    isVisiable: true,
                                    width: k.currentState!.width,
                                    height: k.currentState!.height,
                                    offset: Offset(k.currentState!.left,
                                        k.currentState!.top)),
                                index: context
                                        .read<BlockController>()
                                        .currentSelectedWidgetId -
                                    1);
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        }
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
            width: 0.9 * context.watch<BlockController>().screenWidth / 6,
            child: TextField(
              controller: heightTextController,
              decoration: InputDecoration(
                  hintText: "${k.currentState?.height}",
                  suffix: IconButton(
                      onPressed: () {
                        try {
                          double d = double.parse(heightTextController.text);
                          if (k.currentState!.height != d) {
                            // k.currentState!.setHeight(d);
                            context.read<BlockController>().changeState(
                                current: WidgetState(height: d),
                                prev: WidgetState(
                                    isVisiable: true,
                                    width: k.currentState!.width,
                                    height: k.currentState!.height,
                                    offset: Offset(k.currentState!.left,
                                        k.currentState!.top)),
                                index: context
                                        .read<BlockController>()
                                        .currentSelectedWidgetId -
                                    1);
                          }
                        } catch (_) {}
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ))),
            ),
          ),

          Container(
            height: 5,
            color: Colors.black,
          ),

          Text("距离左侧距离\n${k.currentState!.left.ceil()}"),
          Text("距离顶部距离\n${k.currentState!.top.ceil()}"),

          const SizedBox(
            height: 20,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  context.read<BlockController>().changeCurrentId(-1);
                  // context.read<BlockController>().removeWidgetById(w.index - 1);
                  context.read<BlockController>().changeState(
                      prev: WidgetState(
                          isVisiable: true,
                          width: k.currentState!.width,
                          height: k.currentState!.height,
                          offset: Offset(
                              k.currentState!.left, k.currentState!.top)),
                      current: WidgetState(
                          isVisiable: false,
                          width: k.currentState!.width,
                          height: k.currentState!.height,
                          offset: Offset(
                              k.currentState!.left, k.currentState!.top)),
                      index: w.index - 1);
                },
                child: const Text("删除")),
          ),
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
