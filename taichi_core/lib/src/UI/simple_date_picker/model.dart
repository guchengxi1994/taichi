/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-18 08:32:26
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-18 08:51:10
 */
//日历model
class CalendarModel {
  int? year;
  int? month;
  int? day;
  String? dayType; //日期事件，0，休息，1，异常，2，正常

  CalendarModel({this.year, this.month, this.day, this.dayType = ""});
}

enum CalendarType { visibility, overlay }
