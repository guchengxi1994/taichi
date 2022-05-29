/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:55:23
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:30:42
 */
import 'package:taichi_auth/models/rbac.dart';

class TaichiAuth {
  static final TaichiAuth _instanse = TaichiAuth._();

  factory TaichiAuth() {
    return _instanse;
  }

  late String _modelFilePath = "";
  late String _policyFilePath = "";

  TaichiAuth._();

  void setPaths({required String model, required String policy}) {
    _modelFilePath = model;
    _policyFilePath = policy;
  }

  late RBACModel _rbacModel;
  Future<RBACModel?> _getRbacModel() async {
    _rbacModel = RBACModel(
      modelFilePath: _modelFilePath,
      policyFilePath: _policyFilePath,
    );

    await _rbacModel.init();

    if (_rbacModel.check()) {
      return _rbacModel;
    } else {
      return null;
    }
  }

  RBACModel? _getRbacModelSync() {
    _rbacModel = RBACModel(
      modelFilePath: _modelFilePath,
      policyFilePath: _policyFilePath,
    );

    _rbacModel.initSync();

    if (_rbacModel.check()) {
      return _rbacModel;
    } else {
      return null;
    }
  }

  Future<RBACModel?> get rbac => _getRbacModel();

  RBACModel? get rbacSync => _getRbacModelSync();
}
