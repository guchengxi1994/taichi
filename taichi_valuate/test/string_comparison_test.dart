import 'package:taichi_valuate/extensions/operators.dart';
import 'package:test/test.dart';

void main() {
  const s1 = "我爱中国";
  const s2 = "中国是世界上最好的国家";

  const s3 = "5.15";
  const s4 = "6.15";
  const s5 = "5";

  test("判断字符串`大小`", () {
    expect(s1 > s2, false);
    expect(s3 < s4, true);
    expect(s3 < s5, false);
  });
}
