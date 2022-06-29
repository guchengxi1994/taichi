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

class AccessModel {
  String? userName;
  List<PageAccessModel>? pageAccesses;

  AccessModel({this.userName, this.pageAccesses});
}

class PageAccessModel extends AbsAccessModel {
  String? pageName;
  List<WidgetAccessModel>? widgetAccesses;

  PageAccessModel({this.pageName, this.widgetAccesses});

  @override
  bool canAccess(String? pageName, String? widgetName) {
    throw UnimplementedError();
  }

  @override
  bool isVisible(String? pageName, String? widgetName) {
    throw UnimplementedError();
  }
}

class WidgetAccessModel extends AbsAccessModel {
  String? widgetName;
  WidgetAccessModel({this.widgetName});

  @override
  bool canAccess(String? pageName, String? widgetName) {
    throw UnimplementedError();
  }

  @override
  bool isVisible(String? pageName, String? widgetName) {
    throw UnimplementedError();
  }
}
