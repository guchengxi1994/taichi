import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_board_designer/blocks/entity/_enums.dart';
import 'package:taichi_board_designer/blocks/providers/_right_side_widget_controller.dart';
import 'entity/_operation.dart';

import 'providers/_main_block_controller.dart';
import '_block_wapper.dart';
import 'entity/_constants.dart';
import 'widgets/_right_side_detail_widget.dart';

class RightSideWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RightSideWidget({Key? key}) : super(key: key);

  @override
  State<RightSideWidget> createState() => _RightSideWidgetState();
}

class _RightSideWidgetState extends State<RightSideWidget> {
  final TextEditingController widthTextController = TextEditingController();
  final TextEditingController heightTextController = TextEditingController();
  final TextEditingController descTextController = TextEditingController();
  int groupValue = 1;

  @override
  void dispose() {
    widthTextController.dispose();
    heightTextController.dispose();
    _ancestorController.dispose();
    descTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<RightSideWidgetController>().isChange) {
      return RightSideDetaiWidget(
        controller: context.read<RightSideWidgetController>(),
      );
    }

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
              "??????????????????(???*???)\n${(context.watch<BlockController>().screenWidth * 0.66).ceil()}*${context.watch<BlockController>().screenHeight.ceil()}"),
          const SizedBox(
            height: 20,
          ),

          const Text("??????"),
          Text("${w.index} ${k.currentState!.widgetName}"),

          const Text("??????"),
          SizedBox(
            width: 0.9 * context.watch<BlockController>().screenWidth / 6,
            child: TextField(
              maxLength: 200,
              maxLines: null,
              controller: descTextController,
              decoration: InputDecoration(
                  hintText: "??????????????????",
                  suffix: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {
                            descTextController.text = "";
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          )),
                    ],
                  )),
            ),
          ),
          Container(
            height: 5,
            color: Colors.black,
          ),

          const Text("??????"),
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
          const Text("??????"),
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

          if (context.watch<BlockController>().boardType != BoardType.custom)
            Text("?????????????????????\n${k.currentState!.left.ceil()}"),
          if (context.watch<BlockController>().boardType != BoardType.custom)
            Text("?????????????????????\n${k.currentState!.top.ceil()}"),
          Container(
            height: 5,
            color: Colors.black,
          ),

          const SizedBox(
            height: 10,
          ),

          _changeRelationRegion(),
          if (context.watch<BlockController>().boardType != BoardType.custom)
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
                child: const Text("??????")),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "??????????????????(???*???)\n${(MediaQuery.of(context).size.width * 0.66).ceil()}*${MediaQuery.of(context).size.height.ceil()}",
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

        ///Alignment ???????????? Widget
        alignment: const Alignment(0, 0),

        ///???????????????
        child: InkWell(
          onTap: () async {
            List<Widget> ws =
                context.read<BlockController>().getVisibleWidgets();
            int? result = groupValue;
            result = await showCupertinoDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: ((context, setState) {
                    return CupertinoAlertDialog(
                      title: const Text("???????????????"),
                      content: Material(
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                            child: Column(
                                children: ws.map((e) {
                              return Row(
                                children: [
                                  Radio(
                                      value: (e as BlocksWrapperWidget).index,
                                      groupValue: groupValue,
                                      onChanged: (v) {
                                        setState(() {
                                          groupValue = (v as int);
                                          result = groupValue;
                                        });
                                      }),
                                  Text("${e.index}. ${e.widgetType}")
                                ],
                              );
                            }).toList()),
                          )),
                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop(null);
                            },
                            child: const Text("??????")),
                        CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop(result);
                            },
                            child: const Text("??????"))
                      ],
                    );
                  }));
                });
            debugPrint("[ancestor index]:$result");
            if (result != null &&
                // ignore: use_build_context_synchronously
                result != context.read<BlockController>().currentWidget.index) {
              // ?????????????????? widget type,
              // ??????widget?????? child
              if (result! != 0) {}

              // ignore: use_build_context_synchronously
              context
                  .read<BlockController>()
                  .changeAncestor(ancestorIndex: result!);
              context
                  .read<BlockController>()
                  .globalRightSideKey
                  .currentState!
                  .setState(() {});
            }
          },
          child: TextField(
            ///???????????????
            enabled: false,
            controller: _ancestorController,

            ///???????????? TextField ???????????????
            decoration: InputDecoration(
              labelText:
                  "?????????:  ${context.read<BlockController>().currentKey.currentState!.ancestorIndex}",
              hintMaxLines: 2,
              labelStyle: const TextStyle(color: Colors.black),
              hintText: "???????????????",
              disabledBorder: const OutlineInputBorder(
                ///??????????????????????????????
                borderRadius: BorderRadius.all(Radius.circular(10)),

                ///???????????????????????????
                borderSide: BorderSide(
                  ///?????????????????????
                  color: Colors.blue,

                  ///?????????????????????
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
