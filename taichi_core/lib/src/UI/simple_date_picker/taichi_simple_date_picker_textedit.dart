// ignore_for_file: avoid_init_to_null

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-18 09:06:02
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 10:31:46
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/simple_date_picker/date_picker_provider.dart';
import 'package:taichi/src/UI/simple_date_picker/model.dart';
import 'package:taichi/src/UI/simple_date_picker/styles.dart';

// ignore: must_be_immutable
class DatePickerTextEdit extends StatelessWidget {
  const DatePickerTextEdit(
      {Key? key, this.calendarType = CalendarType.visibility})
      : super(key: key);
  final CalendarType calendarType;

  @override
  Widget build(BuildContext context) {
    if (calendarType == CalendarType.overlay) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            color: const Color.fromARGB(255, 240, 233, 233),
            borderRadius: BorderRadius.circular((5.0))),
        width: DefaultStyle.defaultWidth,
        height: DefaultStyle.defaultHeight,
        child: Row(
          children: [
            Expanded(
                child: Text(context.watch<DatePickerController>().toDate())),
            const Icon(Icons.calendar_month),
          ],
        ),
      );
    }

    return Material(
      child: InkWell(
        onTap: () {
          final offset = (context.findRenderObject() as RenderBox)
              .localToGlobal(const Offset(0, 0));
          debugPrint("[position]:$offset");
          context.read<DatePickerController>().changeVisibility();
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              color: const Color.fromARGB(255, 240, 233, 233),
              borderRadius: BorderRadius.circular((5.0))),
          width: DefaultStyle.defaultWidth,
          height: DefaultStyle.defaultHeight,
          child: Row(
            children: [
              Expanded(
                  child: Text(context.watch<DatePickerController>().toDate())),
              const Icon(Icons.calendar_month),
            ],
          ),
        ),
      ),
    );
  }
}
