import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/blocks/_operation.dart';

import '_block_controller.dart';
import '_block_wapper.dart';
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
    _ancestorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: buildTopPart(),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            flex: 1,
            child: Container(
              width: context.watch<BlockController>().screenWidth / 6,
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  children: context
                      .watch<BlockController>()
                      .operation
                      .operates
                      .map((e) => Text(e.operationType.toStr()))
                      .toList(),
                ),
              ),
            )),
        const Text(
          "Powered by Xiaoshuyui",
          maxLines: 2,
        ),
      ],
    );
  }

  Widget buildTopPart() {
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
                                operationType: OperationType.changeWidth,
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
                                operationType: OperationType.changeHeight,
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
          Container(
            height: 5,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),

          _changeRelationRegion(),

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
                      operationType: OperationType.remove,
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
            "当前主体尺寸(宽*高)\n${(MediaQuery.of(context).size.width * 0.66).ceil()}*${MediaQuery.of(context).size.height.ceil()}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      );
    }
  }

  Widget _changeRelationRegion() {
    return Card(
      child: SizedBox(
        width: context.watch<BlockController>().screenWidth / 6,
        child: Column(
          children: [
            _ancestor(),
          ],
        ),
      ),
    );
  }

  final TextEditingController _ancestorController = TextEditingController();

  Widget _ancestor() {
    return SizedBox(
      width: context.watch<BlockController>().screenWidth / 7,
      height: 50,
      child: Container(
        color: Colors.transparent,

        ///Alignment 用来对齐 Widget
        alignment: const Alignment(0, 0),

        ///文本输入框
        child: InkWell(
          onTap: () async {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("设置父节点"),
                    content: Material(
                        color: Colors.transparent,
                        child: SingleChildScrollView()),
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("取消")),
                      CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("确定"))
                    ],
                  );
                });
          },
          child: TextField(
            ///是否可编辑
            enabled: false,
            controller: _ancestorController,

            ///用来配置 TextField 的样式风格
            decoration: const InputDecoration(
              labelText: "父节点:  0.Taichi board(root)",
              hintMaxLines: 2,
              labelStyle: TextStyle(color: Colors.black),
              hintText: "选择结束时间",
              disabledBorder: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius: BorderRadius.all(Radius.circular(10)),

                ///用来配置边框的样式
                borderSide: BorderSide(
                  ///设置边框的颜色
                  color: Colors.blue,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
