/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 20:30:26
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:33:49
 */
import 'package:taichi_auth/models/perm.dart';

class ACLModel extends PERMModel {
  ACLModel({required String modelFilePath, required String policyFilePath})
      : super(modelFilePath: modelFilePath, policyFilePath: policyFilePath);

  @override
  Future<void> init() async {}

  @override
  void initSync() {}
}
