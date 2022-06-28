/// copied from https://github.com/guchengxi1994/taichi/blob/dart-casbin/taichi_casbin/lib/tools/bracket_match.dart

// ignore_for_file: prefer_final_locals

import 'package:tuple/tuple.dart';

const bracket1 = "()";

class BrackerMatchResult {
  /// 原始的string
  String originString;

  /// 左右括号是否匹配
  bool matches;

  /// 保存下来的括号匹配结果
  ///
  /// eg.
  ///
  /// ```
  ///   some (where (p.eft == allow))
  ///
  ///   那么结果就是 (5,27),...
  /// ```
  List<Tuple2<int, int>> results;

  BrackerMatchResult({
    required this.matches,
    required this.results,
    required this.originString,
  });

  @override
  String toString() {
    if (!matches) {
      return "";
    }
    List<String> subStrs = [];
    for (final i in results) {
      subStrs.add(originString.substring(i.item1 + 1, i.item2));
    }

    return subStrs.join("    ");
  }
}

extension BracketMatch on String {
  BrackerMatchResult getBracketMatches() {
    BrackerMatchResult brackerMatchResult =
        BrackerMatchResult(originString: this, matches: true, results: []);
    if (!contains("(") || !contains(")")) {
      brackerMatchResult.matches = false;
      return brackerMatchResult;
    }

    List<int> openBrackerIndexes = [];
    List<int> closeBrackerIndexes = [];

    for (int i = 0; i <= length - 1; i++) {
      if (this[i] == "(") {
        openBrackerIndexes.add(i);
      }
    }

    for (int i = length - 1; i >= 0; i--) {
      if (this[i] == ")") {
        closeBrackerIndexes.add(i);
      }
    }

    if (openBrackerIndexes.length != closeBrackerIndexes.length) {
      brackerMatchResult.matches = false;
    } else {
      for (int i = 0; i < openBrackerIndexes.length; i++) {
        if (openBrackerIndexes[i] < closeBrackerIndexes[i]) {
          brackerMatchResult.results
              .add(Tuple2(openBrackerIndexes[i], closeBrackerIndexes[i]));
          continue;
        } else {
          brackerMatchResult.matches = false;
          break;
        }
      }
    }

    return brackerMatchResult;
  }
}
