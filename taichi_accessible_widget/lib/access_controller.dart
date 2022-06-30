/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:29:37
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-28 22:20:36
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taichi_accessible_widget/access_model.dart';
import 'package:yaml/yaml.dart';

typedef MapFunction = Future<Map<String, String>> Function();

class AccessController extends ChangeNotifier {
  AccessModel model = AccessModel();
  String role = "";
  Function whenNotValidFunc = () {};

  changeWhenNotValidFunc(Function f) {
    whenNotValidFunc = f;
    notifyListeners();
  }

  changeRole(String r) {
    role = r;
    notifyListeners();
  }

  Rules get rules => _getRules();

  Rules _getRules() {
    if (model.rules == null) {
      return Rules(role: "", resources: []);
    } else {
      return model.rules!.singleWhere((element) => element.role == role,
          orElse: () => Rules(role: "", resources: []));
    }
  }

  /// load a yaml file from asset
  initFromAsset(String assetFilePath) async {
    String data = await rootBundle.loadString(assetFilePath);
    var doc = loadYaml(data);
    model = AccessModel.fromJson(json.decode(json.encode(doc)));
    // debugPrint("[model]:${model.toJson()}");
    // debugPrint("[model resource]:${model.rules![0].resources}");
    notifyListeners();
  }

  /// [recommended]  safer and more convenient than [initFromAsset]
  initFromServer(MapFunction func) async {
    Map<String, String> result = await func();
    model = AccessModel.fromJson(result);
    notifyListeners();
  }
}
