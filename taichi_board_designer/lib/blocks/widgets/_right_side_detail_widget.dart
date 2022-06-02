import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:taichi_board_designer/blocks/providers/_main_block_controller.dart';
import '../providers/_right_side_widget_controller.dart';
import '_custom_container.dart';

class RightSideDetaiWidget extends StatefulWidget {
  const RightSideDetaiWidget({Key? key, required this.controller})
      : super(key: key);
  final RightSideWidgetController controller;

  @override
  State<RightSideDetaiWidget> createState() => _RightSideDetaiWidgetState();
}

class _RightSideDetaiWidgetState extends State<RightSideDetaiWidget> {
  late RightSideWidgetController controller;
  GlobalKey<ShadowContainerViewState> imgViewKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  double _slideValue = 20.0;
  bool _showImage = false;
  bool _needBorder = false;

  bool _borderLeft = true;
  bool _borderTop = true;
  bool _borderBottom = true;
  bool _borderRight = true;

  Color _borderColor = Colors.black;
  double _borderWidth = 1.0;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "[current widget type & id]: ${context.read<BlockController>().currentKey.currentState!.widget.widgetType} & ${context.read<BlockController>().currentSelectedWidgetId}");

    return SingleChildScrollView(
      key: UniqueKey(),
      controller: _scrollController,
      child: _containerDetailedFactorWidget(),
    );
  }

  Widget _containerDetailedFactorWidget() {
    return Column(
      children: [
        const Text("详细属性修改",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        const SizedBox(
          height: 5,
        ),
        Text(
          "当前Widget类型:  ${controller.widgetType}",
          maxLines: 2,
        ),
        ShadowContainerView(
          key: imgViewKey,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: imgViewKey.currentState == null
              ? const Text("修改BorderRadius")
              : Text(
                  "修改BorderRadius: ${imgViewKey.currentState!.radius.ceil()}"),
        ),
        Slider(
            value: _slideValue,
            min: 0,
            max: 100,
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
            semanticFormatterCallback: (double newValue) {
              return '${newValue.round()} dollars}';
            },
            onChanged: (data) {
              setState(() {
                _slideValue = data;
              });

              if ((_borderLeft &&
                      _borderRight &&
                      _borderBottom &&
                      _borderTop) ||
                  (!_borderLeft &&
                      !_borderRight &&
                      !_borderBottom &&
                      !_borderTop)) {
                imgViewKey.currentState!.changeRadius(data);
              }
            }),
        Align(
          alignment: Alignment.centerLeft,
          child: CheckboxListTile(
            title: const Text("显示样板图片"),
            onChanged: (value) {
              if (value != null) {
                if (value) {
                  imgViewKey.currentState!.showBackgroundImage(true);
                  setState(() {
                    _showImage = true;
                  });
                } else {
                  imgViewKey.currentState!.showBackgroundImage(false);
                  setState(() {
                    _showImage = false;
                  });
                }
              }
            },
            value: _showImage,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "color: ",
              style: TextStyle(fontSize: 20),
            ),
            InkWell(
                onTap: () {
                  // ignore: prefer_typing_uninitialized_variables
                  var color;
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          content: SlidePicker(
                              pickerColor: imgViewKey.currentState == null
                                  ? Colors.black
                                  : imgViewKey.currentState!.backgroundColor,
                              onColorChanged: (c) {
                                // debugPrint("[selected color]:$c");
                                color = c;
                              }),
                          actions: [
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("取消")),
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  imgViewKey.currentState!
                                      .changeBackgroundColor(color);
                                  setState(() {});
                                  Navigator.of(context).pop();
                                },
                                child: const Text("确定")),
                          ],
                        );
                      });
                },
                child: Container(
                  width: 40,
                  height: 20,
                  color: imgViewKey.currentState == null
                      ? Colors.black
                      : imgViewKey.currentState!.backgroundColor,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("border"),
                CheckboxListTile(
                  title: const Text("需要边框"),
                  onChanged: (value) {
                    if (value != null) {
                      if (value) {
                        setState(() {
                          _needBorder = true;
                          imgViewKey.currentState!
                              .setBorder(Border.all(color: _borderColor), true);
                        });
                      } else {
                        setState(() {
                          _needBorder = false;
                          imgViewKey.currentState!.setBorder(
                              Border.all(color: _borderColor), false);
                        });
                      }
                    }
                  },
                  value: _needBorder,
                ),
                if (_needBorder)
                  CheckboxListTile(
                    title: const Text("    左"),
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          setState(() {
                            _borderLeft = true;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        } else {
                          setState(() {
                            _borderLeft = false;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        }
                      }
                    },
                    value: _borderLeft,
                  ),
                if (_needBorder)
                  CheckboxListTile(
                    title: const Text("    上"),
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          setState(() {
                            _borderTop = true;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        } else {
                          setState(() {
                            _borderTop = false;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        }
                      }
                    },
                    value: _borderTop,
                  ),
                if (_needBorder)
                  CheckboxListTile(
                    title: const Text("    下"),
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          setState(() {
                            _borderBottom = true;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        } else {
                          setState(() {
                            _borderBottom = false;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        }
                      }
                    },
                    value: _borderBottom,
                  ),
                if (_needBorder)
                  CheckboxListTile(
                    title: const Text("    右"),
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          setState(() {
                            _borderRight = true;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        } else {
                          setState(() {
                            _borderRight = false;
                            imgViewKey.currentState!.setBorder(
                                _buildBorder(), true,
                                noRadius: true);
                          });
                        }
                      }
                    },
                    value: _borderRight,
                  ),
                if (_needBorder &&
                    false ==
                        (_borderLeft &&
                            _borderRight &&
                            _borderBottom &&
                            _borderTop))
                  const Text(
                    "A borderRadius can only be given for a uniform Border. Or use ClipRRect instead.",
                    maxLines: null,
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (_needBorder) const Text("border color"),
                if (_needBorder)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "color: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                          onTap: () {
                            // ignore: prefer_typing_uninitialized_variables
                            var color;
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    content: SlidePicker(
                                        pickerColor: _borderColor,
                                        onColorChanged: (c) {
                                          // debugPrint("[selected color]:$c");
                                          color = c;
                                        }),
                                    actions: [
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("取消")),
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            _borderColor = color;
                                            imgViewKey.currentState!.setBorder(
                                                _buildBorder(), true,
                                                noRadius: true);
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("确定")),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            width: 40,
                            height: 20,
                            color: _borderColor,
                          )),
                    ],
                  ),
                if (_needBorder)
                  Text("border width :${(_borderWidth * 100).toInt() / 100}"),
                if (_needBorder)
                  Slider(
                      value: _borderWidth,
                      min: 1.0,
                      max: 5,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()} dollars}';
                      },
                      onChanged: (data) {
                        setState(() {
                          _borderWidth = data;
                          imgViewKey.currentState!
                              .setBorder(_buildBorder(), true, noRadius: true);
                        });
                      }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            child: const Text("确定修改"),
            onPressed: () {
              context
                  .read<BlockController>()
                  .changeCustomStyle(imgViewKey.currentState!.decorationStyle);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            child: const Text("生成代码"),
            onPressed: () {
              debugPrint("[debug code] : ${imgViewKey.currentState!.toCode()}");
            },
          ),
        ),
      ],
    );
  }

  Border _buildBorder() {
    return Border(
      top: _borderTop
          ? BorderSide(color: _borderColor, width: _borderWidth)
          : BorderSide.none,
      left: _borderLeft
          ? BorderSide(color: _borderColor, width: _borderWidth)
          : BorderSide.none,
      right: _borderRight
          ? BorderSide(color: _borderColor, width: _borderWidth)
          : BorderSide.none,
      bottom: _borderBottom
          ? BorderSide(color: _borderColor, width: _borderWidth)
          : BorderSide.none,
    );
  }
}
