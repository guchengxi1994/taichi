// ignore_for_file: avoid_print

/// copied from https://github.com/guchengxi1994/taichi/blob/dart-casbin/taichi_casbin/test/regex_test.dart
void main() {
  String testStr = "r.sub == p.sub && r.obj == p.obj && r.act == p.act";
  testStr = testStr.replaceAll(" ", "");

  final stringRegex1 = RegExp(
    r"[\&]{2}|[\|]{2}",
    multiLine: true,
  );

  final stringRegex2 = RegExp(
    r"[^|&]*\.[^|&]*[==][^|&]*\.[^|&]*",
    multiLine: true,
  );

  print(stringRegex2.allMatches(testStr).map((e) => e.group(0)).toList());
  print(stringRegex1.allMatches(testStr).map((e) => e.group(0)).toList());

  print(testStr.indexOf("r.sub==p.sub"));
  print(testStr.indexOf("r.obj==p.obj"));
}
