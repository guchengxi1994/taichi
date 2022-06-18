/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-17 21:50:18
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 11:23:26
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/simple_date_picker/styles.dart';
import 'package:taichi/src/UI/simple_date_picker/taichi_simple_date_picker_body.dart';

import 'date_picker_provider.dart';
import 'taichi_simple_date_picker_textedit.dart';

// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
  DatePicker({Key? key, this.onTap}) : super(key: key);
  DateCallBack? onTap;

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
                    constraints: const BoxConstraints(
                        maxHeight: DefaultStyle.defaultWidth + 50),
                    width: DefaultStyle.defaultWidth,
                    child: DatePickerBody(
                      // onTap: (year, month, day) {
                      //   debugPrint("[date]:$year-$month-$day");
                      // },
                      onTap: onTap,
                    ),
                  ))
            ],
          );
        });
  }
}

class DatePickerBuilder {
  static Widget simple({DateCallBack? onTap}) {
    return DatePicker(
      onTap: onTap ??
          (year, month, day) {
            debugPrint("[date]:$year-$month-$day");
          },
    );
  }
}
