/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-19 19:24:42
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-19 19:52:26
 */
extension StringExtension on String {
  /// 首字母大写的 extension
  String cAPItalize() {
    if (length == 0) {
      return "";
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String format(List l) {
    var res = this;
    for (var i in l) {
      res = res.replaceFirst("{%v}", i.toString());
    }

    return res;
  }
}
