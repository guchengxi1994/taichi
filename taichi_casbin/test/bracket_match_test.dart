/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 18:44:23
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 18:39:02
 */
import 'package:taichi_auth/tools/bracket_match.dart';
import 'package:test/test.dart';

void main() {
  const s = "some (where (p.eft == allow))";

  test("测试括号是不是左右对应", () {
    final result = s.getBracketMatches();
    // ignore: avoid_print
    print(result.toString());
    expect(result.matches, true);
  });
}
