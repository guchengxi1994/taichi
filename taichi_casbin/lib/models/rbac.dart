/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:51:39
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-30 19:10:36
 */
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/matchers/functions.dart';
import 'package:taichi_auth/models/perm.dart';

class RBACModel extends PERMModel {
  RBACModel({required String modelFilePath, required String policyFilePath})
      : assert(modelFilePath != "" && policyFilePath != ""),
        super(modelFilePath: modelFilePath, policyFilePath: policyFilePath);
  late Config? model = Config();
  late List<List<dynamic>>? csvTable = [];
  late List<String> names = [];
  late List<Equatable> subjects = [];
  late List<Equatable> objects = [];
  late List<Equatable> actions = [];

  Map<String, List<dynamic>> get policiesTest => {
        "names": names,
        "subjects": subjects,
        "objects": objects,
        "actions": actions
      };

  List<Policy> getPolicies() {
    // ignore: prefer_final_locals
    List<Policy> results = [];
    for (int i = 0; i < names.length; i++) {
      results.add(
        Policy(
          action: actions[i],
          object: objects[i],
          subject: subjects[i],
          effect: null,
        ),
      );
    }

    return results;
  }

  @override
  Future<void> init() async {
    // ignore: avoid_print
    print("[debug] init rbac");
    final File modelFile = File(modelFilePath);
    final File policyFile = File(policyFilePath);
    if (await modelFile.exists() && await policyFile.exists()) {
      model = Config.fromStrings(await modelFile.readAsLines());
      csvTable =
          const CsvToListConverter().convert(await policyFile.readAsString());
      for (int i = 0; i < csvTable!.length; i++) {
        assert(csvTable![i].length >= 4);
        subjects.add(csvTable![i][1].toString().toEquatable());
        names.add(csvTable![i][0].toString());
        objects.add(csvTable![i][2].toString().toEquatable());
        actions.add(csvTable![i][3].toString().toEquatable());
      }
    }
  }

  bool check() {
    if (null == model || null == csvTable) {
      return false;
    }
    return true;
  }

  @override
  void initSync() {
    final File modelFile = File(modelFilePath);
    final File policyFile = File(policyFilePath);
    if (modelFile.existsSync() && policyFile.existsSync()) {
      model = Config.fromStrings(modelFile.readAsLinesSync());
      csvTable =
          const CsvToListConverter().convert(policyFile.readAsStringSync());
      for (int i = 0; i < csvTable!.length; i++) {
        assert(csvTable![i].length >= 4);
        subjects.add(csvTable![i][1].toString().toEquatable());
        names.add(csvTable![i][0].toString());
        objects.add(csvTable![i][2].toString().toEquatable());
        actions.add(csvTable![i][3].toString().toEquatable());
      }
    }
  }

  bool? canAccess(Request r) {
    if (check()) {
      final matcher = model?.get("matchers", "m");
      // print(matcher);
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
