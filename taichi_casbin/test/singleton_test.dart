/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 19:59:26
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 18:34:44
 */

import 'package:taichi_auth/models/taichi_auth.dart';
import 'package:test/test.dart';

void main() {
  test("测试是不是同一个对象", () {
    final TaichiAuth a = TaichiAuth();

    final TaichiAuth b = TaichiAuth();

    expect(identical(a, b), true);
  });
}
