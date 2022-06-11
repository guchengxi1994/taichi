/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 11:46:23
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 18:51:30
 */

import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

class ScreenTypeUtils {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static ScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 850) {
      return ScreenType.mobile;
    } else if (width >= 850 && width < 1100) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}
