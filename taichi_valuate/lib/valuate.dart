/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-25 22:26:12
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-26 08:42:37
 */

enum ExpTypes { math, logic, custom }

class Valuate {
  String expression;
  ExpTypes type;

  Valuate({required this.expression, required this.type});
}
