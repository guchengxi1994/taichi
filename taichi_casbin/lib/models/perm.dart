/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:31:04
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:27:31
 */
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:ini/ini.dart';
import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/matchers/functions.dart';

abstract class PERMModel {
  /// ini config files
  String modelFilePath;

  /// csv files according to casbin
  String policyFilePath;

  late Config? model = Config();
  late List<List<dynamic>>? csvTable = [];

  PERMModel({required this.modelFilePath, required this.policyFilePath});

  /// init 方法中读取文件
  Future<void> init() async {
    final File modelFile = File(modelFilePath);
    final File policyFile = File(policyFilePath);

    if (await modelFile.exists() && await policyFile.exists()) {
      model = Config.fromStrings(await modelFile.readAsLines());
      csvTable =
          const CsvToListConverter().convert(await policyFile.readAsString());
    }
  }

  // initSync
  void initSync() {
    final File modelFile = File(modelFilePath);
    final File policyFile = File(policyFilePath);

    if (modelFile.existsSync() && policyFile.existsSync()) {
      model = Config.fromStrings(modelFile.readAsLinesSync());
      csvTable =
          const CsvToListConverter().convert(policyFile.readAsStringSync());
    }
  }

  List<Policy> getPolicies();

  bool check() {
    if (null == model || null == csvTable) {
      return false;
    }
    return true;
  }

  bool? canAccess(Request r) {
    if (check()) {
      final matcher = model?.get("matchers", "m");
      if (matcher != null) {
        return matchersToBool(matcher, getPolicies(), r);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
