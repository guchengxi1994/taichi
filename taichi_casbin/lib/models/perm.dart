/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:31:04
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:27:31
 */
abstract class PERMModel {
  /// ini config files
  String modelFilePath;

  /// csv files according to casbin
  String policyFilePath;

  PERMModel({required this.modelFilePath, required this.policyFilePath});

  /// init 方法中读取文件
  Future<void> init();

  // initSync
  void initSync();
}
