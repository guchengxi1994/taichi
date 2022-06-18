/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-17 21:50:18
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 10:33:03
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/simple_date_picker/taichi_simple_date_picker_body.dart';

import 'date_picker_provider.dart';
import 'taichi_simple_date_picker_textedit.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DatePickerController()..init(),
        builder: (c, s) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DatePickerTextEdit(),
              Visibility(
                  visible: c.watch<DatePickerController>().isVisible,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 350),
                    width: 300,
                    child: const DatePickerBody(),
                  ))
            ],
          );
        });
  }
}
