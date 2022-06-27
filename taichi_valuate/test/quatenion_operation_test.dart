// ignore_for_file: prefer_final_locals

import 'package:taichi_valuate/calculate/integer_quatenion_operation.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  IntegerQuatenionOperation operation =
      IntegerQuatenionOperation(expression: "48*((70-65)-43)+8*1");
  IntegerQuatenionOperation operation2 =
      IntegerQuatenionOperation(expression: "4*(6+78)+53-9/2+45*8");

  test("测试是不是相等的", () {
    expect(operation.getResult(), -1816);
    expect(operation2.getResult(), 744);
  });
}
