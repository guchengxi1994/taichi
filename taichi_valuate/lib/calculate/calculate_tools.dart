/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 21:08:10
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 21:11:45
 */

import 'package:taichi_valuate/extensions/format.dart';

typedef GenerateEqualityFunction = List<String> Function(String s);

class CalculateTools {
  CalculateTools._();

  static List<String> equalitiesFromString(
    GenerateEqualityFunction f,
    String s,
  ) {
    return f(s);
  }

  static String equalityFormat(String origin, String keyword) {
    return origin.replaceFirst(keyword, "{%v}");
  }

  static String format(String origin, List<String> data) {
    return origin.format(data);
  }

  static String equalityFormatFromList(String origin, List<String> keywords) {
    String cp = origin;
    for (final i in keywords) {
      cp = cp.replaceFirst(i, "{%v}");
    }

    return cp;
  }
}
