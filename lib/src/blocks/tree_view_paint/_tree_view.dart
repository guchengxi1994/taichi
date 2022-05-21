/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-20 22:26:05
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-21 14:59:22
 */
import 'package:flutter/material.dart';

import '../_block_controller.dart';
import '../_block_wapper.dart';

/// 组件间的结构树
///
/// 用 custom paint 展示
///
/// 不考虑组件的位置
// ignore: must_be_immutable
class TreeView extends StatefulWidget {
  TreeView({Key? key, required this.controller}) : super(key: key);
  BlockController controller;

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(1000, 800),
      painter: TreeViewPainter(controller: widget.controller),
      // child: Container(
      //   width: 1000,
      //   height: 800,
      //   color: Colors.transparent,
      // ),
    );
  }
}

Map<int, List<int>> sortWidgetList(BlockController controller) {
  Map<int, List<int>> result = {
    0: [0], // root
  };

  List<GlobalKey<BlocksWrapperWidgetState>> widgets = controller.globalKeys;
  List bak = [];
  int iter = 1;

  while (bak.length < widgets.length) {
    result[iter] = [];
    int lastIter = iter - 1;
    for (var w in widgets) {
      if (result[lastIter]!.contains(w.currentState!.ancestorIndex)) {
        result[iter]!.add(w.currentState!.widget.index);
        // widgets.remove(w);
        bak.add(w);
      }
    }
    iter += 1;
  }

  return result;
}

class TreeViewPainter extends CustomPainter {
  BlockController controller;
  TreeViewPainter(
      {required this.controller, this.inSize = const Size(1000, 800)});
  Size inSize;

  // [定义画笔]
  final Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    var result = sortWidgetList(controller);
    var keys = result.keys.toList();
    int max = keys.last + 2;
    for (var i in keys) {
      // 根节点
      if (i == 0) {
        continue;
      }

      var v = result[i];

      double dx_ = inSize.width / max;
      if (v != null && v.isNotEmpty) {
        double dy_ = inSize.height / (v.length + 1);

        for (int j = 0; j < v.length; j++) {
          var toDy = (j + 1) * dy_;
          var toDx = (i + 1) * dx_;
          var key = controller.getKeyById(v[j]);

          var ancestorIndex = key.currentState!.ancestorIndex;
          var ancestorIndexInResult = result[i - 1]!.indexOf(ancestorIndex);
          debugPrint("[ancestorIndexInResult]:$ancestorIndexInResult");
          var fromDx = i * dx_;
          var fromDy = dy_ * (ancestorIndexInResult + 1);
          var path = Path();
          path.moveTo(fromDx, fromDy);
          debugPrint("[$fromDx][$fromDy][$toDx][$toDy]");
          // path.quadraticBezierTo(fromDx, fromDy, toDx, toDy);
          path.lineTo(toDx, toDy);
          canvas.drawPath(path, _paint);
          // print("should paint");
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
