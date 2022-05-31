/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 20:30:26
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:33:49
 */

import 'package:equatable/equatable.dart';
import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/models/perm.dart';

class ACLParams {
  bool requireResource;
  bool requireUser;
  bool requireSuperuser;

  ACLParams({
    this.requireResource = true,
    this.requireSuperuser = false,
    this.requireUser = true,
  });
}

class ACLModel extends PERMModel {
  ACLModel({
    required String modelFilePath,
    required String policyFilePath,
    this.aclParams,
  }) : super(modelFilePath: modelFilePath, policyFilePath: policyFilePath);

  late List<String> names = [];
  late List<Equatable> subjects = [];
  late List<Equatable> objects = [];
  late List<Equatable> actions = [];

  ACLParams? aclParams;

  @override
  List<Policy> getPolicies() {
    // ignore: prefer_final_locals
    List<Policy> results = [];
    for (int i = 0; i < names.length; i++) {
      results.add(
        Policy(
          action: actions[i],
          object: aclParams!.requireResource ? objects[i] : "".toEquatable(),
          subject: aclParams!.requireUser ? subjects[i] : "".toEquatable(),
          effect: null,
        ),
      );
    }

    return results;
  }

  @override
  Future<void> init() async {
    // ignore: avoid_print
    print("[debug] init acl");

    await super.init();

    aclParams ??= ACLParams();

    if (check()) {
      assert(
        aclParams!.requireResource != false && aclParams!.requireUser != false,
      );
      for (int i = 0; i < csvTable!.length; i++) {
        if (aclParams!.requireResource && aclParams!.requireUser) {
          subjects.add(csvTable![i][1].toString().toEquatable());
          names.add(csvTable![i][0].toString());
          objects.add(csvTable![i][2].toString().toEquatable());
          actions.add(csvTable![i][3].toString().toEquatable());
        }

        if (aclParams!.requireResource && !aclParams!.requireUser) {
          names.add(csvTable![i][0].toString());
          objects.add(csvTable![i][1].toString().toEquatable());
          actions.add(csvTable![i][2].toString().toEquatable());
        }

        if (!aclParams!.requireResource && aclParams!.requireUser) {
          subjects.add(csvTable![i][1].toString().toEquatable());
          names.add(csvTable![i][0].toString());
          actions.add(csvTable![i][2].toString().toEquatable());
        }
      }
    }
  }

  @override
  void initSync() {
    super.initSync();
    // ignore: avoid_print
    print("[debug] init rbac acl");

    aclParams ??= ACLParams();

    if (csvTable != null && model != null) {
      assert(
        aclParams!.requireResource != false && aclParams!.requireUser != false,
      );
      for (int i = 0; i < csvTable!.length; i++) {
        if (aclParams!.requireResource && aclParams!.requireUser) {
          subjects.add(csvTable![i][1].toString().toEquatable());
          names.add(csvTable![i][0].toString());
          objects.add(csvTable![i][2].toString().toEquatable());
          actions.add(csvTable![i][3].toString().toEquatable());
        }

        if (aclParams!.requireResource && !aclParams!.requireUser) {
          names.add(csvTable![i][0].toString());
          objects.add(csvTable![i][1].toString().toEquatable());
          actions.add(csvTable![i][2].toString().toEquatable());
        }

        if (!aclParams!.requireResource && aclParams!.requireUser) {
          subjects.add(csvTable![i][1].toString().toEquatable());
          names.add(csvTable![i][0].toString());
          actions.add(csvTable![i][2].toString().toEquatable());
        }
      }
    }
  }
}
