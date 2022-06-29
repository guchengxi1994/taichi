/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-29 21:08:10
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-29 21:11:45
 */

typedef GenerateEqualityFunction = List<String> Function(String s);

class CalculateTools {
  CalculateTools._();

  static List<String> equalitiesFromString(
    GenerateEqualityFunction f,
    String s,
  ) {
    return f(s);
  }
}
