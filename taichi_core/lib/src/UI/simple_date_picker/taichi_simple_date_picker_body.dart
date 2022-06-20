/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-17 21:55:11
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 11:13:22
 */

/// modified from https://blog.csdn.net/qq_22492233/article/details/121678380

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/simple_date_picker/date_picker_provider.dart';
import 'package:taichi/src/UI/simple_date_picker/styles.dart';
import 'package:taichi/src/utils/t_dateutils.dart';

import 'model.dart';

typedef DateCallBack = void Function(int year, int month, int day);

class DatePickerBody extends StatefulWidget {
  const DatePickerBody({Key? key, this.onTap}) : super(key: key);
  final DateCallBack? onTap;

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerBodyState createState() => _DatePickerBodyState();
}

class _DatePickerBodyState extends State<DatePickerBody> {
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _day = DateTime.now().day;
  final List<CalendarModel> _datas = [];

  final TDateUtils dateUtils = TDateUtils();

  @override
  void initState() {
    //设置默认当前月日期
    super.initState();
    // _setDatas(year: _year, month: _month);
  }

  @override
  Widget build(BuildContext context) {
    _year = context.watch<DatePickerController>().year;
    _month = context.watch<DatePickerController>().month;
    _day = context.watch<DatePickerController>().day;
    _setDatas(year: _year, month: _month);
    return Scaffold(
        body: Container(
      // margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        //设置颜色
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        //设置四周边框
      ),
      child: Column(
        children: [
          _yearHeader(),
          _weekHeader(),
          _everyDay(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    context.read<DatePickerController>().init();
                    context
                        .read<DatePickerController>()
                        .changeVisibilityWithParam(false);
                  },
                  child: const Text("取消")),
              TextButton(
                  onPressed: () {
                    context
                        .read<DatePickerController>()
                        .changeVisibilityWithParam(false);
                  },
                  child: const Text("确定"))
            ],
          )
        ],
      ),
    ));
  }

  //头部年
  Widget _yearHeader() {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _lastMonth();
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          Text(
            "$_year 年$_month 月",
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          GestureDetector(
            onTap: () {
              _nextMonth();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }

  //中部周
  Widget _weekHeader() {
    var array = [
      "一",
      "二",
      "三",
      "四",
      "五",
      "六",
      "日",
    ];
    return Container(
      color: DefaultStyle.monthTitleColor,
      // height: 20,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemCount: array.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 7,
            //纵轴间距
            // mainAxisSpacing: ScreenUtil().setHeight(10),
            // 横轴间距
            // crossAxisSpacing: ScreenUtil().setWidth(15),
            //子组件宽高长度比例
            childAspectRatio: 2),
        itemBuilder: (context, index) {
          return Container(
              alignment: Alignment.center,
              child: Text(
                array[index],
                style: TextStyle(
                    color:
                        index == 5 || index == 6 ? Colors.black : Colors.black,
                    fontSize: 13),
              ));
        },
      ),
    );
  }

  //底部日
  Widget _everyDay() {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      itemCount: _getRowsForMonthYear(year: _year, month: _month) * 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 7,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (_datas[index].month == _month && _datas[index].year == _year) {
              // debugPrint(
              //     "[year month index]:$_year  $_month  ${_datas[index].day}");

              if (widget.onTap != null) {
                widget.onTap!(_year, _month, _datas[index].day!);
              }

              context
                  .read<DatePickerController>()
                  .changeDate(_year, _month, _datas[index].day!);
            }
          },
          child: Column(
            children: [
              Container(
                width: 25,
                height: 25,
                //设置底部背景
                decoration: context
                        .watch<DatePickerController>()
                        .isThisDay(_datas[index])
                    ? DefaultStyle.selectedStyle
                    : const BoxDecoration(),
                child: Center(
                  child: Text(
                    //不是当前月不显示值
                    _datas[index].month == _month
                        ? _datas[index].day.toString()
                        : "",
                    //设置选中字体颜色，以及周末和工作日颜色
                    style: context
                            .watch<DatePickerController>()
                            .isThisDay(_datas[index])
                        ? const TextStyle(fontSize: 16, color: Colors.white)
                        : (index % 7 == 5 || index % 7 == 6
                            ? const TextStyle(fontSize: 16, color: Colors.red)
                            : const TextStyle(
                                fontSize: 16, color: Colors.black)),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              //设置底部小圆点，非当前月的不显示，设置为透明，其余的根据状态判断显示
              _datas[index].month == _month &&
                      _datas[index].dayType != "" &&
                      _datas[index].dayType != "0"
                  ? Container(
                      height: 6.0,
                      width: 6.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _datas[index].dayType == "1"
                              ? const Color(0xFFF48835)
                              : const Color(0xFF2C91F6)),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  // 获取行数
  int _getRowsForMonthYear({int? year, int? month}) {
    //当前月天数
    var currentMonthDays = dateUtils.getCurrentMonthDays(year!, month!);
    //
    var placeholderDays = _getPlaceholderDays(year: year, month: month);

    int rows = (currentMonthDays + placeholderDays) ~/ 7;

    int remainder = (currentMonthDays + placeholderDays) % 7;
    if (remainder > 0) {
      rows = rows + 1;
    }
    return rows;
  }

  // 得到这个月的第一天是星期几
  int _getPlaceholderDays({int? year, int? month}) {
    return DateTime(year!, month!).weekday - 1 % 7;
  }

  /// 获取展示信息
  _setDatas({int? year, int? month}) {
    /// 上个月占位
    var lastYear = year;
    var lastMonth = month! - 1;
    if (month == 1) {
      lastYear = year! - 1;
      lastMonth = 12;
    }

    var placeholderDays = _getPlaceholderDays(year: year, month: month);
    var lastMonthDays = dateUtils.getCurrentMonthDays(lastYear!, lastMonth);
    var firstDay = lastMonthDays - placeholderDays;
    for (var i = 0; i < placeholderDays; i++) {
      _datas.add(CalendarModel(
          year: lastYear,
          month: lastMonth,
          day: firstDay + i + 1,
          dayType: ""));
    }

    /// 本月显示
    var currentMonthDays = dateUtils.getCurrentMonthDays(year!, month);
    for (var i = 0; i < currentMonthDays; i++) {
      if (i == _day - 1) {
        _datas.add(
            CalendarModel(year: year, month: month, day: i + 1, dayType: ""));
      } else {
        _datas.add(
            CalendarModel(year: year, month: month, day: i + 1, dayType: ""));
      }
    }

    /// 下个月占位
    var nextYear = year;
    var nextMonth = month + 1;
    if (month == 12) {
      nextYear = year + 1;
      nextMonth = 1;
    }
    var nextPlaceholderDays =
        _getPlaceholderDays(year: nextYear, month: nextMonth);
    for (var i = 0; i < 7 - nextPlaceholderDays; i++) {
      _datas.add(CalendarModel(
          year: nextYear, month: nextMonth, day: i + 1, dayType: ""));
    }
  }

  // 上月
  _lastMonth() {
    setState(() {
      if (_month == 1) {
        _year = _year - 1;
        _month = 12;
      } else {
        _month = _month - 1;
      }
      if (_month == DateTime.now().month) {
        _day = DateTime.now().day;
      } else {
        _day = 1; //查看上一个月时，默认选中的为第一天
      }

      context.read<DatePickerController>().changeDate(_year, _month, _day);
      _datas.clear();
      _setDatas(year: _year, month: _month);
    });
  }

  // 下月
  _nextMonth() {
    _setNextMonthData();
  }

  //设置下个月的数据
  _setNextMonthData() {
    setState(() {
      if (_month == 12) {
        _year = _year + 1;
        _month = 1;
      } else {
        _month = _month + 1;
      }
      if (_month == DateTime.now().month) {
        //如果下个月时当前月，默认选中当天
        _day = DateTime.now().day;
      } else {
        //如果不是当前月，默认选中第一天
        _day = 1;
      }
      context.read<DatePickerController>().changeDate(_year, _month, _day);
      _datas.clear();
      _setDatas(year: _year, month: _month);
    });
  }
}

class DatePickerBody2 extends StatefulWidget {
  const DatePickerBody2(
      {Key? key,
      this.onTap,
      this.onCancel,
      this.onOK,
      required this.ancestorContext})
      : super(key: key);
  final DateCallBack? onTap;
  final VoidCallback? onOK;
  final VoidCallback? onCancel;
  final BuildContext ancestorContext;

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerBody2State createState() => _DatePickerBody2State();
}

class _DatePickerBody2State extends State<DatePickerBody2> {
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _day = DateTime.now().day;
  final List<CalendarModel> _datas = [];

  final TDateUtils dateUtils = TDateUtils();

  @override
  void initState() {
    //设置默认当前月日期
    super.initState();
    // _setDatas(year: _year, month: _month);
    // debugPrint(
    //     "[context]:${(widget.ancestorContext.read<DatePickerController>() == null)}");
  }

  @override
  Widget build(BuildContext context) {
    _year = widget.ancestorContext.watch<DatePickerController>().year;
    _month = widget.ancestorContext.watch<DatePickerController>().month;
    _day = widget.ancestorContext.watch<DatePickerController>().day;
    _setDatas(year: _year, month: _month);
    return Scaffold(
        body: Container(
      // margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        //设置颜色
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        //设置四周边框
      ),
      child: Column(
        children: [
          _yearHeader(),
          _weekHeader(),
          _everyDay(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: widget.onCancel ??
                      () {
                        widget.ancestorContext
                            .read<DatePickerController>()
                            .init();
                        widget.ancestorContext
                            .read<DatePickerController>()
                            .changeVisibilityWithParam(false);

                        setState(() {});
                      },
                  child: const Text("取消")),
              TextButton(
                  onPressed: widget.onOK ??
                      () {
                        widget.ancestorContext
                            .read<DatePickerController>()
                            .changeVisibilityWithParam(false);
                        setState(() {});
                      },
                  child: const Text("确定"))
            ],
          )
        ],
      ),
    ));
  }

  //头部年
  Widget _yearHeader() {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _lastMonth();
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          Text(
            "$_year 年$_month 月",
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          GestureDetector(
            onTap: () {
              _nextMonth();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }

  //中部周
  Widget _weekHeader() {
    var array = [
      "一",
      "二",
      "三",
      "四",
      "五",
      "六",
      "日",
    ];
    return Container(
      color: DefaultStyle.monthTitleColor,
      // height: 20,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemCount: array.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 7,
            //纵轴间距
            // mainAxisSpacing: ScreenUtil().setHeight(10),
            // 横轴间距
            // crossAxisSpacing: ScreenUtil().setWidth(15),
            //子组件宽高长度比例
            childAspectRatio: 2),
        itemBuilder: (context, index) {
          return Container(
              alignment: Alignment.center,
              child: Text(
                array[index],
                style: TextStyle(
                    color:
                        index == 5 || index == 6 ? Colors.black : Colors.black,
                    fontSize: 13),
              ));
        },
      ),
    );
  }

  //底部日
  Widget _everyDay() {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      itemCount: _getRowsForMonthYear(year: _year, month: _month) * 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 7,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            debugPrint(
                "[year month index]:$_year  $_month  ${_datas[index].day}");
            if (_datas[index].month == _month && _datas[index].year == _year) {
              // debugPrint(
              //     "[year month index]:$_year  $_month  ${_datas[index].day}");

              if (widget.onTap != null) {
                widget.onTap!(_year, _month, _datas[index].day!);
              }

              widget.ancestorContext
                  .read<DatePickerController>()
                  .changeDate(_year, _month, _datas[index].day!);

              setState(() {});
            }
          },
          child: Column(
            children: [
              Container(
                width: 25,
                height: 25,
                //设置底部背景
                decoration: widget.ancestorContext
                        .watch<DatePickerController>()
                        .isThisDay(_datas[index])
                    ? DefaultStyle.selectedStyle
                    : const BoxDecoration(),
                child: Center(
                  child: Text(
                    //不是当前月不显示值
                    _datas[index].month == _month
                        ? _datas[index].day.toString()
                        : "",
                    //设置选中字体颜色，以及周末和工作日颜色
                    style: widget.ancestorContext
                            .watch<DatePickerController>()
                            .isThisDay(_datas[index])
                        ? const TextStyle(fontSize: 16, color: Colors.white)
                        : (index % 7 == 5 || index % 7 == 6
                            ? const TextStyle(fontSize: 16, color: Colors.red)
                            : const TextStyle(
                                fontSize: 16, color: Colors.black)),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              //设置底部小圆点，非当前月的不显示，设置为透明，其余的根据状态判断显示
              _datas[index].month == _month &&
                      _datas[index].dayType != "" &&
                      _datas[index].dayType != "0"
                  ? Container(
                      height: 6.0,
                      width: 6.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _datas[index].dayType == "1"
                              ? const Color(0xFFF48835)
                              : const Color(0xFF2C91F6)),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  // 获取行数
  int _getRowsForMonthYear({int? year, int? month}) {
    //当前月天数
    var currentMonthDays = dateUtils.getCurrentMonthDays(year!, month!);
    //
    var placeholderDays = _getPlaceholderDays(year: year, month: month);

    int rows = (currentMonthDays + placeholderDays) ~/ 7;

    int remainder = (currentMonthDays + placeholderDays) % 7;
    if (remainder > 0) {
      rows = rows + 1;
    }
    return rows;
  }

  // 得到这个月的第一天是星期几
  int _getPlaceholderDays({int? year, int? month}) {
    return DateTime(year!, month!).weekday - 1 % 7;
  }

  /// 获取展示信息
  _setDatas({int? year, int? month}) {
    /// 上个月占位
    var lastYear = year;
    var lastMonth = month! - 1;
    if (month == 1) {
      lastYear = year! - 1;
      lastMonth = 12;
    }

    var placeholderDays = _getPlaceholderDays(year: year, month: month);
    var lastMonthDays = dateUtils.getCurrentMonthDays(lastYear!, lastMonth);
    var firstDay = lastMonthDays - placeholderDays;
    for (var i = 0; i < placeholderDays; i++) {
      _datas.add(CalendarModel(
          year: lastYear,
          month: lastMonth,
          day: firstDay + i + 1,
          dayType: ""));
    }

    /// 本月显示
    var currentMonthDays = dateUtils.getCurrentMonthDays(year!, month);
    for (var i = 0; i < currentMonthDays; i++) {
      if (i == _day - 1) {
        _datas.add(
            CalendarModel(year: year, month: month, day: i + 1, dayType: ""));
      } else {
        _datas.add(
            CalendarModel(year: year, month: month, day: i + 1, dayType: ""));
      }
    }

    /// 下个月占位
    var nextYear = year;
    var nextMonth = month + 1;
    if (month == 12) {
      nextYear = year + 1;
      nextMonth = 1;
    }
    var nextPlaceholderDays =
        _getPlaceholderDays(year: nextYear, month: nextMonth);
    for (var i = 0; i < 7 - nextPlaceholderDays; i++) {
      _datas.add(CalendarModel(
          year: nextYear, month: nextMonth, day: i + 1, dayType: ""));
    }
  }

  // 上月
  _lastMonth() {
    setState(() {
      if (_month == 1) {
        _year = _year - 1;
        _month = 12;
      } else {
        _month = _month - 1;
      }
      if (_month == DateTime.now().month) {
        _day = DateTime.now().day;
      } else {
        _day = 1; //查看上一个月时，默认选中的为第一天
      }

      widget.ancestorContext
          .read<DatePickerController>()
          .changeDate(_year, _month, _day);
      _datas.clear();
      _setDatas(year: _year, month: _month);
    });
  }

  // 下月
  _nextMonth() {
    _setNextMonthData();
  }

  //设置下个月的数据
  _setNextMonthData() {
    setState(() {
      if (_month == 12) {
        _year = _year + 1;
        _month = 1;
      } else {
        _month = _month + 1;
      }
      if (_month == DateTime.now().month) {
        //如果下个月时当前月，默认选中当天
        _day = DateTime.now().day;
      } else {
        //如果不是当前月，默认选中第一天
        _day = 1;
      }
      widget.ancestorContext
          .read<DatePickerController>()
          .changeDate(_year, _month, _day);
      _datas.clear();
      _setDatas(year: _year, month: _month);
    });
  }
}
