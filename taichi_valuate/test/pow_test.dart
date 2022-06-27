import 'package:taichi_valuate/extensions/on_strings.dart';
import 'package:test/test.dart';

void main() {
  test("测试string平方", () {
    const String s1 = "5";
    const String s2 = "5.2";
    const String s3 = "5.d";

    expect(s1.square(), 25);
    expect(s2.square(), 5.2 * 5.2);
    expect(s3.square(), null);
  });

  test("测试string多次方", () {
    const String s1 = "5";
    const String s3 = "5.d";

    expect(s1.pow(2), 25);
    expect(s3.pow(2), null);
  });
}
