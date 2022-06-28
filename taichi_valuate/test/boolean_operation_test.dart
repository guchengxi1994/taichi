// ignore_for_file: avoid_print

import 'package:taichi_valuate/calculate/boolean_quatenion_operation.dart';
import 'package:taichi_valuate/extensions/operators.dart';
import 'package:test/test.dart';

void main() {
  /// without "()""
  final BooleanQuatenionOperation operation =
      BooleanQuatenionOperation(expression: "5 != 6 && 7 == 8 && 9 >= 10");
  final BooleanQuatenionOperation operation2 =
      BooleanQuatenionOperation(expression: "5 != 6");
  final BooleanQuatenionOperation operation3 =
      BooleanQuatenionOperation(expression: "5 < 6");
  final BooleanQuatenionOperation operation4 =
      BooleanQuatenionOperation(expression: " 6>5");
  final BooleanQuatenionOperation operation5 =
      BooleanQuatenionOperation(expression: " 6》5");
  final BooleanQuatenionOperation operation7 =
      BooleanQuatenionOperation(expression: " 9>=10");

  test("测试bool值", () {
    expect(operation.getResult(), false);
    expect(operation2.getResult(), true);
    expect(operation3.getResult(), true);
    expect(operation4.getResult(), true);
    expect(operation5.getResult(), null);
    expect(operation7.getResult(), false);
  });

  /// with "()"
  final BooleanQuatenionOperation operation6 =
      BooleanQuatenionOperation(expression: "5 != 6 && (7 == 8 && (9 >= 10))");
  print(operation6.getResult());
}
