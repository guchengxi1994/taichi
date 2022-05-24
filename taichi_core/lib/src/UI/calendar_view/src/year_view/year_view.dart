import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

import '../../../../utils/t_dateutils.dart';
import '../event_controller.dart';
import 'day_box.dart';
import 'event_days.dart';

// ignore: must_be_immutable
class YearView<T> extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  YearView({Key? key, this.locale = "zh_CN", required this.controller})
      : super(key: key);
  String locale;
  final EventController<T> controller;

  @override
  State<YearView> createState() => _YearViewState();
}

class _YearViewState<T> extends State<YearView> {
  final _dateUtils = TDateUtils();
  late final List<int> _days = _dateUtils.data.values.toList();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<EventDays> scheduleDates = widget.controller.getDates();
    debugPrint("[dates list length]:${scheduleDates.length}");
    var currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 35 * 32,
      height: 35 * 13,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 32 * 13,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 32,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            var rowId = index ~/ 32;
            if (rowId == 0) {
              if ((index % 32) == 0) {
                if (currentWidth < 35 * 32) {
                  return const Center(child: Text(""));
                } else {
                  return const Center(child: Text("月/天"));
                }
              }
              return Container(
                margin: const EdgeInsets.all(1),
                color: const Color.fromARGB(255, 185, 141, 105),
                child: Center(child: Text((index % 32).toString())),
              );
            }

            var lang = widget.locale;

            var months =
                lang == "zh_CN" ? _dateUtils.months_CN : _dateUtils.months_en;
            var columnId = (index % 32);
            if (columnId == 0) {
              if (currentWidth < 35 * 32) {
                return Center(child: Text(rowId.toString()));
              }
              return Center(child: Text(months[rowId]));
            }

            if (columnId < _days[rowId] + 1) {
              var utc = DateTime(_dateUtils.year, rowId, columnId).isSaturday ||
                  DateTime(_dateUtils.year, rowId, columnId).isSunday;
              var thisDay = DateTime(_dateUtils.year, rowId, columnId);
              // debugPrint("[thisDay]:$thisDay");
              BoxStatus status = BoxStatus.nothing;
              for (var sd in scheduleDates) {
                // debugPrint("[sd.date]:${sd.date}");
                if (sd.date.simpleEquals(thisDay)) {
                  // debugPrint("[should be here]");
                  status = sd.status;
                }
              }

              return DayBox(
                isWeekend: utc,
                rowId: rowId,
                columnId: columnId,
                boxStatus: status,
                year: _dateUtils.year,
              );
            } else {
              return DayBox(
                isWeekend: false,
                rowId: rowId,
                columnId: columnId,
                boxStatus: BoxStatus.cannotSelected,
                year: _dateUtils.year,
              );
            }
          }),
    );
  }
}
