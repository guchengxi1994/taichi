import 'package:taichi_valuate/extensions/bracket_match.dart';
import 'package:test/test.dart';

/// copied from https://github.com/guchengxi1994/taichi/blob/dart-casbin/taichi_casbin/test/bracket_match_test.dart
void main() {
  const s = "some (where (p.eft == allow))";

  test("测试括号是不是左右对应", () {
    final result = s.getBracketMatches();
    // ignore: avoid_print
    print(result.toString());
    expect(result.matches, true);
  });
}
