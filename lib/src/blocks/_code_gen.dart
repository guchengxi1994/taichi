/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-19 19:03:30
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-19 21:01:15
 */
import 'package:flutter/material.dart';

import '_enums.dart';
import '_drag_controller.dart';
import '_t_block_wapper.dart';
import 'templete_codes/_file_title.dart';
import 'templete_codes/positioned_code.dart';
import 'templete_codes/stack_templete_code.dart';
import 'tools/string_extension.dart';

class NullWidget extends StatelessWidget {
  const NullWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

String codeGenerator(BlockController controller, String className) {
  String result = fileTitle;

  if (controller.widgets.isEmpty) {
    return result;
  }

  var w = controller.widgets.indexWhere(
    (element) => (element as BlocksWrapperWidget).widgetType == "AppBar",
  );

  if (w != -1) {
    result += stackStatelessTempleteCodeWithAppbar;
    result = result.replaceAll("{appbarHeight}",
        (controller.globalKeys[w]).currentState!.height.toString());
  } else {
    result += stackStatelessTempleteCode;
  }

  result = result.replaceAll("{name}", className.cAPItalize());

  if (controller.boardType == BoardType.stack) {
    var childrenStr = "";
    for (int i = 0; i < controller.widgets.length; i++) {
      if ((controller.widgets[i] as BlocksWrapperWidget).widgetType !=
          "AppBar") {
        var state = controller.globalKeys[i].currentState!;

        if (state.isVisiable) {
          var s = positionedStr.format([
            state.left.toInt(),
            state.top.toInt(),
            state.height.toInt(),
            state.width.toInt()
          ]);

          s = s.replaceFirst("{child}", state.widget.widgetType);

          childrenStr += s;
        }
      }
    }
    result = result.replaceFirst("{children}", childrenStr);
  }

  return result;
}
