import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/matchers/functions.dart';
import 'package:test/test.dart';

void main() {
  final Request r = Request(
    action: "read".toEquatable(),
    object: "database1".toEquatable(),
    subject: "Jack".toEquatable(),
  );

  final Policy p1 = Policy(
    action: "write".toEquatable(),
    object: "database1".toEquatable(),
    subject: "jack".toEquatable(),
    effect: "none",
  );

  final Policy p2 = Policy(
    action: "read".toEquatable(),
    object: "database1".toEquatable(),
    subject: "Jack".toEquatable(),
    effect: "none",
  );

  const matcher = "m = r.sub == p.sub && r.obj == p.obj && r.act == p.act";

  test("测试能不能通过matchers", () {
    expect(matchersToBool(matcher, [p1], r), false);
    expect(
      matchersToBool(matcher, [p1, p2], r),
      true,
      reason: matchersToBool(matcher, [p1, p2], r).toString(),
    );
  });
}
