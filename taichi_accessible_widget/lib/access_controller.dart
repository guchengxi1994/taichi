/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-28 21:29:37
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-07-02 10:19:55
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taichi_accessible_widget/access_model.dart';
import 'package:tuple/tuple.dart';
import 'package:yaml/yaml.dart';

typedef MapFunction = Future<Map<String, String>> Function();

class AccessController extends ChangeNotifier {
  AccessModel model = AccessModel();
  String role = "";

  final List<Tuple4<int, String?, bool?, bool?>> _cachedRules = [];

  Tuple4<int, String?, bool?, bool?> getRule(int i) {
    return _cachedRules.firstWhere(
      (element) => element.item1 == i,
      orElse: () => const Tuple4(0, null, null, null),
    );
  }

  int get ruleLength => _cachedRules.length;

  addRule(int i, String? s, bool? visible, bool? accessible) {
    final tmp = Tuple4(i, s, visible, accessible);
    if (_cachedRules.contains(tmp)) {
      _cachedRules.remove(tmp);
      _cachedRules.add(tmp);
      return;
    }
    if (_cachedRules.length >= model.cacheMaxLength!) {
      _cachedRules.removeAt(0);
    }
    _cachedRules.add(tmp);
    // print("[_cachedRules]:$_cachedRules");
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
