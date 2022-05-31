/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:51:39
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-30 19:10:36
 */

import 'package:equatable/equatable.dart';
import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/models/perm.dart';

class RBACModel extends PERMModel {
  RBACModel({required String modelFilePath, required String policyFilePath})
      : assert(modelFilePath != "" && policyFilePath != ""),
        super(modelFilePath: modelFilePath, policyFilePath: policyFilePath);
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

  @override
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

    await super.init();

    if (csvTable != null && model != null) {
      for (int i = 0; i < csvTable!.length; i++) {
        assert(csvTable![i].length >= 4);
        subjects.add(csvTable![i][1].toString().toEquatable());
        names.add(csvTable![i][0].toString());
        objects.add(csvTable![i][2].toString().toEquatable());
        actions.add(csvTable![i][3].toString().toEquatable());
      }
    }
  }

  @override
  void initSync() {
    super.initSync();

    // ignore: avoid_print
    print("[debug] init rbac sync");

    if (csvTable != null && model != null) {
      for (int i = 0; i < csvTable!.length; i++) {
        assert(csvTable![i].length >= 4);
        subjects.add(csvTable![i][1].toString().toEquatable());
        names.add(csvTable![i][0].toString());
        objects.add(csvTable![i][2].toString().toEquatable());
        actions.add(csvTable![i][3].toString().toEquatable());
      }
    }
  }
}
