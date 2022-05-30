/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-30 19:34:12
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-30 19:50:21
 */
part of 'functions.dart';

bool effectMatch(String effect) {
  assert(effect.contains("some") && effect.contains("where"));
  final s = effect.replaceAll(" ", "");
  final List<String> slist = s.split("&&");
  if (slist.length == 1) {
  } else {}
  return false;
}
