/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-29 10:32:03
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 18:31:14
 */
import 'package:taichi_auth/auth.dart';

Future<void> main() async {
  final TaichiAuth taichiAuth = TaichiAuth();

  taichiAuth.setPaths(model: "test/config.ini", policy: "test/test.csv");

  final rbac = await taichiAuth.rbac;

  if (rbac != null) {
    // ignore: avoid_print
    print(rbac.policies);
  }
}
