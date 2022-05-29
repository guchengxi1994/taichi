/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-29 18:10:47
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 19:03:40
 */

part of 'entities.dart';

/// 这里考虑后续可能存在 数组或者其他数据格式的subject，
///
/// object和action，所以让几个泛型都继承了 Equatable
class Request<T extends Equatable, E extends Equatable, V extends Equatable> {
  T subject;
  E object;
  V action;

  Request({required this.action, required this.object, required this.subject});
}
