/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-29 18:15:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 19:01:54
 */

import 'package:equatable/equatable.dart';

part 'policy.dart';
part 'request.dart';
part 'matcher_entity.dart';

// ignore: must_be_immutable
class EquatableString extends Equatable {
  String str;

  EquatableString({this.str = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [str];

  @override
  String toString() {
    return str;
  }
}

extension EqExtension on String {
  EquatableString toEquatable() {
    return EquatableString(str: trim());
  }
}

extension EqOnP on Policy {
  @Deprecated("use ```equalsByFomula``` instead")
  bool equals(Request r) {
    return subject == r.subject && object == r.object && action == r.action;
  }

  bool equalsByFomula(Request r, MatcherEntity entity) {
    if (entity.formulas.length == 1) {
      return entity.formulas[0].fomulaEquals(this, r);
    } else {
      // ignore: prefer_final_locals
      List<bool> fomulaResults = [];
      for (final i in entity.formulas) {
        fomulaResults.add(i.fomulaEquals(this, r));
      }

      // print(fomulaResults);

      bool result = true && fomulaResults[0];

      for (int j = 0; j < entity.operators.length; j++) {
        if (entity.operators[j] == "&&") {
          result = result && (fomulaResults[j + 1]);
        } else {
          result = result || (fomulaResults[j + 1]);
        }
      }
      return result;
    }
  }
}

extension EqOnR on Request {
  @Deprecated("use ```equalsByFomula``` instead")
  bool equals(Policy p) {
    return subject == p.subject && object == p.object && action == p.action;
  }

  bool equalsByFomula(Policy p, MatcherEntity entity) {
    if (entity.formulas.length == 1) {
      return entity.formulas[0].fomulaEquals(p, this);
    } else {
      // ignore: prefer_final_locals
      List<bool> fomulaResults = [];
      for (final i in entity.formulas) {
        fomulaResults.add(i.fomulaEquals(p, this));
      }

      bool result = true && fomulaResults[0];

      for (int j = 0; j < entity.operators.length; j++) {
        if (entity.operators[j] == "&&") {
          result = result && (fomulaResults[j + 1]);
        } else {
          result = result || (fomulaResults[j + 1]);
        }
      }
      return result;
    }
  }
}

extension FomulaExtension on String {
  bool fomulaEquals(Policy p, Request r) {
    String operator = "";
    if (contains("==")) {
      operator = "==";
    } else {
      operator = "!=";
    }

    final List<String> ls = split(operator);

    late Equatable left;
    late Equatable right;

    if (ls[0].contains("p.sub")) {
      left = p.subject;
    }
    if (ls[0].contains("p.obj")) {
      left = p.object;
    }
    if (ls[0].contains("p.act")) {
      left = p.action;
    }
    if (ls[1].contains("p.sub")) {
      left = p.subject;
    }
    if (ls[1].contains("p.obj")) {
      left = p.object;
    }
    if (ls[1].contains("p.act")) {
      left = p.action;
    }

    if (ls[0].contains("r.sub")) {
      right = r.subject;
    }
    if (ls[0].contains("r.obj")) {
      right = r.object;
    }
    if (ls[0].contains("r.act")) {
      right = r.action;
    }
    if (ls[1].contains("r.sub")) {
      right = r.subject;
    }
    if (ls[1].contains("r.obj")) {
      right = r.object;
    }
    if (ls[1].contains("r.act")) {
      right = r.action;
    }

    // print("[left]: ${left} [right]:${right}");
    if ((left as EquatableString).str == "" ||
        (right as EquatableString).str == "") {
      return true;
    }

    switch (operator) {
      case "==":
        return right == left;
      case "!=":
        return right != left;
      default:
        return right == left;
    }
  }
}
