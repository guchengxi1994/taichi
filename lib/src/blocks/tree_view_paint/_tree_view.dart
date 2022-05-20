/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-20 22:26:05
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-20 22:47:25
 */
import 'package:flutter/material.dart';

/// 组件间的结构树
///
/// 用 custom paint 展示
///
/// 不考虑组件的位置
class TreeView extends StatelessWidget {
  const TreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Container(),
    );
  }
}
