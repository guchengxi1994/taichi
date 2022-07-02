/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:29:47
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-07-02 07:49:07
 */

class AccessModel {
  List<Rules>? rules;
  int? cacheMaxLength;
  AccessModel({this.rules, this.cacheMaxLength});

  AccessModel.fromJson(Map<String, dynamic> json) {
    cacheMaxLength = json['cacheMaxLength'];
    if (json['rules'] != null) {
      rules = <Rules>[];
      json['rules'].forEach((v) {
        rules!.add(Rules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cacheMaxLength'] = cacheMaxLength!;
    if (rules != null) {
      data['rules'] = rules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rules {
  String? role;
  List<String>? resources;

  Rules({this.role, this.resources});

  Rules.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    resources = json['resources'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['resources'] = resources;
    return data;
  }

  String? grep(String pageName, String widgetName) {
    String regString =
        "(pagename==$pageName[^&|]*|widgetname==$widgetName[^&|]*)";
    // print(regString);
    // print("resources:$resources");
    final RegExp r = RegExp(regString);
    if (resources == null || resources!.isEmpty) {
      return null;
    }
    for (final i in resources!) {
      final res =
          r.allMatches(i.replaceAll(" ", "")).map((e) => e.group(0)).toList();
      if (res.length != 2) {
        continue;
      }

      if (res.contains("pagename==$pageName") &&
          res.contains("widgetname==$widgetName")) {
        return i;
      }
    }

    return null;
  }
}
