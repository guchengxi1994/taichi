/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:29:47
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-28 21:56:05
 */

abstract class AbsAccessModel {
  bool canAccess(String? pageName, String? widgetName);
  bool isVisible(String? pageName, String? widgetName);
}

class AccessModel extends AbsAccessModel {
  String? userName;
  String? pageName;
  String? widgetName;
  List<String>? accesses;

  AccessModel({
    this.accesses,
    this.pageName,
    this.userName,
    this.widgetName,
  });

  @override
  bool canAccess(String? pageName, String? widgetName) {
    return false;
  }

  @override
  bool isVisible(String? pageName, String? widgetName) {
    return false;
  }
}
