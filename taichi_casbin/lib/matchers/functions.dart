/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 20:26:33
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-30 19:34:39
 */
import 'package:taichi_auth/entities/entities.dart';
import 'package:taichi_auth/tools/bracket_match.dart';

part 'ip_match.dart';
part 'priority.dart';
part 'effect_match.dart';

const String matcherRegex1 = r"[^|&]*\.[^|&]*[==][^|&]*\.[^|&]*";
const String matcherRegex2 = r"[\&]{2}|[\|]{2}";

bool matchersToBool(String matcherStr, List<Policy> ps, Request r) {
  final BrackerMatchResult brackerMatchResult = matcherStr.getBracketMatches();
  if (!brackerMatchResult.matches) {
    final MatcherEntity entity = matcherStr.splitByOperator();
    return entity.getResult(ps, r);
  }

  return false;
}

extension Operation on String {
  @Deprecated("unused")
  String getSubString() {
    for (int i = 0; i < length; i++) {
      if (this[i] == "=" && this[i + 1] != "=") {
        return substring(i + 1);
      }
    }
    return this;
  }

  MatcherEntity splitByOperator() {
    List<String> fomulas = [];
    List<String> operators = [];
    final subStr = replaceAll(" ", "");
    fomulas = RegExp(matcherRegex1)
        .allMatches(subStr)
        .map((e) => e.group(0)!)
        .toList();
    operators = RegExp(matcherRegex2)
        .allMatches(subStr)
        .map((e) => e.group(0)!)
        .toList();
    return MatcherEntity(formulas: fomulas, operators: operators);
  }
}
