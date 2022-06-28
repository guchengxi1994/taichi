// ignore_for_file: avoid_print, prefer_final_locals

/// copied from https://github.com/guchengxi1994/taichi/blob/dart-casbin/taichi_casbin/test/regex_test.dart
void main() {
  String testStr = "r.sub == p.sub && r.obj == p.obj && r.act == p.act";
  String testStr2 = "r.sub != p.sub && r.obj == p.obj && r.act >= p.act";
  String testStr3 = "我爱中国";
  String testStr4 = "5 != 6 && 7 == 8 && 9 >= 10";
  String testStr5 = "r.sub == p.sub || r.obj == p.obj && r.act == p.act";
  testStr = testStr.replaceAll(" ", "");

  final operaterRegex = RegExp("[=]{2}|[!][=]|[>][=]|[>]|[<][=]|[<]");

  final operaterRegex1 = RegExp(r"(&&|\|\|)");

  final stringRegex1 = RegExp(
    r"[\&]{2}|[\|]{2}",
    multiLine: true,
  );

  final stringRegex2 = RegExp(
    r"[^|&]*\.[^|&]*[==][^|&]*\.[^|&]*",
    multiLine: true,
  );

  final stringRegex4 = RegExp(
    "[^|&]*(==|>=|<=|!=)[^|&]*",
    multiLine: true,
  );

  final stringRegex3 = RegExp("[\\u4e00-\\u9fa5]+");

  print(stringRegex2.allMatches(testStr).map((e) => e.group(0)).toList());
  print(stringRegex1.allMatches(testStr).map((e) => e.group(0)).toList());
  print(stringRegex4.allMatches(testStr4).map((e) => e.group(0)).toList());
  print("================================================================");
  print(stringRegex3.hasMatch("我"));
  print(stringRegex3.hasMatch("中"));
  print("================================================================");
  print(stringRegex3.allMatches(testStr3[0]).map((e) => e.group(0)).toList());
  print(operaterRegex.allMatches(testStr).map((e) => e.group(0)).toList());
  print(operaterRegex.allMatches(testStr2).map((e) => e.group(0)).toList());
  print("================================================================");
  print(testStr.indexOf("r.sub==p.sub"));
  print(testStr.indexOf("r.obj==p.obj"));
  print("================================================================");
  print(operaterRegex1.allMatches(testStr5).map((e) => e.group(0)).toList());
}
