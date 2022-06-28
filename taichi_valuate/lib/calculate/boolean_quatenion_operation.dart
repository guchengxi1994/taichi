// ignore_for_file: unused_element

import 'package:taichi_valuate/calculate/abstract_operation.dart';
import 'package:taichi_valuate/extensions/bracket_match.dart';
import 'package:taichi_valuate/extensions/operators.dart';

final operaterRegex1 = RegExp(r"(&&|\|\|)");
final operaterRegex2 = RegExp("[=]{2}|[!][=]|[>][=]|[>]|[<][=]|[<]");
final queRegex = RegExp("[^|&]*(==|>=|<=|!=|>|<)[^|&]*");

/// get boolean result from a string
///
/// Usage:
///
/// ```dart
/// /// without "()"
/// final BooleanQuatenionOperation operation =
///      BooleanQuatenionOperation(expression: "5 != 6 && 7 == 8 && 9 >= 10");
///  final BooleanQuatenionOperation operation2 =
///      BooleanQuatenionOperation(expression: "5 != 6");
///  final BooleanQuatenionOperation operation3 =
///      BooleanQuatenionOperation(expression: "5 < 6");
///  final BooleanQuatenionOperation operation4 =
///      BooleanQuatenionOperation(expression: " 6>5");
///  final BooleanQuatenionOperation operation5 =
///     BooleanQuatenionOperation(expression: " 6》5");
/// test("测试bool值", () {
///   expect(operation.getResult(), false);
///   expect(operation2.getResult(), true);
///   expect(operation3.getResult(), true);
///   expect(operation4.getResult(), true);
///   expect(operation5.getResult(), null);
///  });
/// ```
class BooleanQuatenionOperation extends AbstractOperation {
  BooleanQuatenionOperation({required String expression})
      : super(expression: expression);

  @override
  bool? getResult() {
    expression = expression.replaceAll(" ", "");
    if (expression.contains("(") || expression.contains(")")) {
      print(_getResultWithBracket(expression));
    } else {
      return _getResultWithoutBracket(expression);
    }
  }

  String? _getResultWithBracket(String ex) {
    String exCopy = ex;
    final bracketResult = exCopy.getBracketMatches();
    if (bracketResult.matches == false) {
      return null;
    }
    for (final i in bracketResult.results) {
      final s = ex.substring(i.item1 + 1, i.item2);
      // print("[substr]:$s");
      print("[s1]:$s");
      if (!s.contains("(") && !s.contains(")")) {
        final bool? result = _getResultWithoutBracket(s);
        exCopy = exCopy.replaceAll("($s)", result.toString());
      } else {
        print("[s2]:$s");
        final String? result = _getResultWithBracket(s);
        print("[result]:$result");
        exCopy = exCopy.replaceAll("($s)", result.toString());
      }
    }

    return exCopy;
  }

  bool? _getResultWithoutBracket(String ex) {
    final queRegRes = queRegex.allMatches(ex).map((e) => e.group(0)!).toList();
    final operatorRegRes =
        operaterRegex1.allMatches(ex).map((e) => e.group(0)!).toList();

    if (operatorRegRes.length + 1 != queRegRes.length) {
      return null;
    }
    final List<bool?> queResults = _getResultFromQueList(queRegRes);

    if (queResults.length == 1) {
      return queResults[0];
    }

    bool? result = true;

    for (int i = 0; i < queResults.length - 1; i++) {
      if (queResults[i] != null && queResults[i + 1] != null) {
        if (operatorRegRes[i] == "&&") {
          result = result! && (queResults[i]! && queResults[i + 1]!);
        } else {
          result = result! && (queResults[i]! || queResults[i + 1]!);
        }
      } else {
        result = null;
        break;
      }
    }

    return result;
  }

  bool? _getResultFromQue(String que) {
    String? operator;
    if (que.contains("==")) {
      operator = "==";
    } else if (que.contains(">=")) {
      operator = ">=";
    } else if (que.contains("<=")) {
      operator = "<=";
    } else if (que.contains("!=")) {
      operator = "!=";
    } else if (que.contains("<") && !que.contains("<=")) {
      operator = "<";
    } else if (que.contains(">") && !que.contains(">=")) {
      operator = ">";
    } else {
      operator = null;
    }
    if (operator != null) {
      final List<String> factors = que.replaceAll(" ", "").split(operator);

      if (factors.length != 2 || factors[0].isEmpty || factors[1].isEmpty) {
        return null;
      }

      final String left = factors[0];
      final String right = factors[1];

      switch (operator) {
        case "==":
          return left == right;
        case ">=":
          return left >= right;
        case "<=":
          return left <= right;
        case ">":
          return left > right;
        case "<":
          return left < right;
        case "!=":
          return left != right;
        default:
          return null;
      }
    } else {
      return null;
    }
  }

  List<bool?> _getResultFromQueList(List<String> ques) {
    final List<bool?> result = [];
    for (final i in ques) {
      result.add(_getResultFromQue(i));
    }

    return result;
  }

  bool _equals(String left, String right) {
    return left == right;
  }

  bool? _notEquals(String left, String right) {
    return left != right;
  }

  bool? _greater(String left, String right) {
    return left > right;
  }

  bool? _less(String left, String right) {
    return left < right;
  }

  bool? _greaterOrEquals(String left, String right) {
    return left >= right;
  }

  bool? _lessOrEquals(String left, String right) {
    return left <= right;
  }
}
