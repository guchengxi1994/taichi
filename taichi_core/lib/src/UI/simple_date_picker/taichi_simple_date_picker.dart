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
import 'package:taichi/src/UI/simple_date_picker/model.dart';
import 'package:taichi/src/UI/simple_date_picker/styles.dart';
import 'package:taichi/src/UI/simple_date_picker/taichi_simple_date_picker_body.dart';

import 'date_picker_provider.dart';
import 'taichi_simple_date_picker_textedit.dart';

/// [SimpleDatePicker]使用的是visibility可见不可见控件实现的
// ignore: must_be_immutable
class SimpleDatePicker extends StatelessWidget {
  SimpleDatePicker({Key? key, this.onDayTap}) : super(key: key);
  DateCallBack? onDayTap;

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
                      onTap: onDayTap,
                    ),
                  ))
            ],
          );
        });
  }
}

/// [DatePickerWithOverlay]使用的是Overlay
// ignore: must_be_immutable
class DatePickerWithOverlay extends StatelessWidget {
  DatePickerWithOverlay({Key? key, this.onDayTap, this.onCancel, this.onOK})
      : super(key: key);
  final DateCallBack? onDayTap;
  final VoidCallback? onCancel;
  final VoidCallback? onOK;

  // ignore: avoid_init_to_null, prefer_final_fields
  late OverlayEntry? _overlayEntry = null;

  final LayerLink layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DatePickerController()..init(),
      builder: (c, s) {
        return InkWell(
          onTap: () {
            final offset = (context.findRenderObject() as RenderBox)
                .localToGlobal(const Offset(0, 0));
            try {
              _overlayEntry?.remove();
            } catch (_) {}

            debugPrint("[position]:$offset");

            _overlayEntry = OverlayEntry(builder: (_) {
              return UnconstrainedBox(
                child: CompositedTransformFollower(
                  link: layerLink,
                  targetAnchor: Alignment.topLeft,
                  offset: const Offset(0, DefaultStyle.defaultHeight),
                  // left: offset.dx,
                  // top: offset.dy + DefaultStyle.defaultHeight,
                  child: Container(
                    constraints: const BoxConstraints(
                        maxHeight: DefaultStyle.defaultWidth + 50),
                    width: DefaultStyle.defaultWidth,
                    child: DatePickerBody2(
                      onTap: onDayTap,
                      onCancel: () {
                        if (onCancel != null) {
                          onCancel!();
                        }
                        debugPrint("cancel");
                        c.read<DatePickerController>().init();
                        try {
                          _overlayEntry?.remove();
                        } catch (_) {}
                      },
                      onOK: () {
                        if (onOK != null) {
                          onOK!();
                        }
                        debugPrint("ok");
                        try {
                          _overlayEntry?.remove();
                        } catch (_) {}
                      },
                      ancestorContext: c,
                    ),
                  ),
                ),
              );
            });

            Overlay.of(c)?.insert(_overlayEntry!);
          },
          child: CompositedTransformTarget(
            link: layerLink,
            child: const DatePickerTextEdit(
              calendarType: CalendarType.overlay,
            ),
          ),
        );
      },
    );
  }
}
