// ignore_for_file: prefer_final_locals, avoid_print

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
import 'package:taichi_auth/entities/entities.dart';

Future<void> main() async {
  var t1 = DateTime.now();
  final TaichiAuth taichiAuth = TaichiAuth();

  taichiAuth.setPaths(model: "test/config.ini", policy: "test/test.csv");

  final rbac = await taichiAuth.rbac;

  final Request r = Request(
    action: "read".toEquatable(),
    object: "database1".toEquatable(),
    subject: "Jack".toEquatable(),
  );

  bool? res;
  bool? res2;

  if (rbac != null) {
    res = taichiAuth.canAccess("rbac", r);

    print("[debug res] $res");

    res2 = taichiAuth.canAccess("rbac", r);
    print("[debug res2] $res2");
  }

  var t2 = DateTime.now();

  print(t2.difference(t1).inMilliseconds);

  // test("测试能不能通过rbac", () {
  //   expect(res, false);
  // });
}
