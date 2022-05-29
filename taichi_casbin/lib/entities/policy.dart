/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-29 18:06:01
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 19:04:03
 */
part of 'entities.dart';

/// 这里考虑后续可能存在 数组或者其他数据格式的subject，
///
/// object和action，所以让几个泛型都继承了 Equatable
class Policy<T extends Equatable, E extends Equatable, V extends Equatable, R> {
  T subject;
  E object;
  V action;
  R effect;

  Policy({
    required this.action,
    required this.object,
    required this.subject,
    required this.effect,
  });
}
