/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 18:36:56
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 19:28:10
 */
import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';

class MainScreenAppbar extends StatelessWidget {
  MainScreenAppbar({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  late final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Colors.grey[200]!,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: type != ScreenType.desktop,
      title: ScreenType.desktop == type ? const Text("Taichi Admin") : null,
      centerTitle: false,
      elevation: type == ScreenType.mobile ? 4 : 0,
      actions: ScreenType.desktop == type
          ? [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black87), //文字大小、颜色
                    maxLines: 1, //最多多少行
                    decoration: InputDecoration(
                      fillColor: Colors.grey[50], //背景颜色，必须结合filled: true,才有效
                      filled: true, //重点，必须设置为true，fillColor才有效
                      isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10), //内容内边距，影响高度
                      border: _outlineInputBorder, //边框，一般下面的几个边框一起设置
                      focusedBorder: _outlineInputBorder,
                      enabledBorder: _outlineInputBorder,
                      disabledBorder: _outlineInputBorder,
                      focusedErrorBorder: _outlineInputBorder,
                      errorBorder: _outlineInputBorder,
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ]
          : [],
    );
  }
}
