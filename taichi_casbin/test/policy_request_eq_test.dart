// ignore_for_file: deprecated_member_use_from_same_package

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-29 18:39:36
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 19:10:01
 */
import 'package:taichi_auth/entities/entities.dart';
import 'package:test/test.dart';

void main() {
  test("测试policy和request是不是相等的", () {
    final Policy policy = Policy(
      action: "aaa".toEquatable(),
      object: "ooo".toEquatable(),
      subject: "sss".toEquatable(),
      effect: "eee",
    );

    final Request request = Request(
      action: "aaa".toEquatable(),
      object: "ooo".toEquatable(),
      subject: "sss".toEquatable(),
    );

    expect(policy.equals(request), true);
    expect(request.equals(policy), true);
  });
}
