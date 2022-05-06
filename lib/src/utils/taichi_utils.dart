import 'dart:io';
import 'package:flutter/foundation.dart';

part './t_platform_utils.dart';

class TaichiDevUtils {
  TaichiDevUtils._();

  static bool get isWeb => _TaichiPlatformUtils._isWeb();
  static bool get isAndroid => _TaichiPlatformUtils._isAndroid();
  static bool get isIOS => _TaichiPlatformUtils._isIOS();
  static bool get isMacOS => _TaichiPlatformUtils._isMacOS();
  static bool get isWindows => _TaichiPlatformUtils._isWindows();
  static bool get isFuchsia => _TaichiPlatformUtils._isFuchsia();
  static bool get isLinux => _TaichiPlatformUtils._isLinux();
  static bool get isMobile =>
      _TaichiPlatformUtils._isAndroid() || _TaichiPlatformUtils._isIOS();
}
