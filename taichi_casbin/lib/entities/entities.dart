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

// ignore: must_be_immutable
class EquatableString extends Equatable {
  String str;

  EquatableString({this.str = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [str];
}

extension EqExtension on String {
  EquatableString toEquatable() {
    return EquatableString(str: this);
  }
}

extension EqOnP on Policy {
  bool equals(Request r) {
    return subject == r.subject && object == r.object && action == r.action;
  }
}

extension EqOnR on Request {
  bool equals(Policy p) {
    return subject == p.subject && object == p.object && action == p.action;
  }
}
