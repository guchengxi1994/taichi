/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 12:59:38
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-04 19:50:36
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/fit/_fitness_provider.dart';

const _fitnessVersion = "0.0.2-alpha";

class _TaichiFitness extends StatefulWidget {
  const _TaichiFitness({Key? key, required this.child, required this.context})
      : super(key: key);

  final Widget? child;
  final BuildContext? context;

  static Widget Function(BuildContext context, Widget? child)? init(
      {double? designWidth, double? designHeight}) {
    return (BuildContext context, Widget? child) {
      return ChangeNotifierProvider(
          create: (_) => FitnessController()
            ..init(designHeight: designHeight, designWidth: designWidth),
          child: _TaichiFitness(
            context: context,
            child: child,
          ));
    };
  }

  @override
  State<_TaichiFitness> createState() => _TaichiFitnessState();
}

class _TaichiFitnessState extends State<_TaichiFitness> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      debugPrint(MediaQuery.of(context).size.toString());
      context
          .read<FitnessController>()
          .changeHeight(MediaQuery.of(context).size.height);
      context
          .read<FitnessController>()
          .changeWidth(MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: widget.child,
    );
  }
}

extension SizeExtension on num {
  double setWidth(BuildContext? context) {
    TaichiFitnessUtil.init(context);
    return TaichiFitnessUtil().setWidth(toDouble());
  }

  double get w => TaichiFitnessUtil().setWidth(toDouble());

  double setHeight(BuildContext? context) {
    TaichiFitnessUtil.init(context);
    return TaichiFitnessUtil().setHeight(toDouble());
  }

  double get h => TaichiFitnessUtil().setHeight(toDouble());

  double setSp(BuildContext? context) {
    TaichiFitnessUtil.init(context);
    return TaichiFitnessUtil().setSp(toDouble());
  }

  double get sp => TaichiFitnessUtil().setSp(toDouble());
}

/// v0.0.1-alpha
/// ``` dart
/// class TaichiFitnessUtil {
///   BuildContext? context;
///   TaichiFitnessUtil(this.context);

///   double setWidth(double v) {
///     if (context == null) {
///       return v;
///     }

///     return v * context!.watch<FitnessController>().scaleWidth;
///   }

///   double setHeight(double v) {
///     if (context == null) {
///       return v;
///     }
///     return v * context!.watch<FitnessController>().scaleHeight;
///   }
/// }
/// ```
///
/// current version 0.0.2-alpha
class TaichiFitnessUtil {
  BuildContext? context;
  static late TaichiFitnessUtil _instance;

  static String get version => _fitnessVersion;

  TaichiFitnessUtil._();
  factory TaichiFitnessUtil() {
    return _instance;
  }

  static void init(BuildContext? context) {
    // debugPrint("call init function");
    _instance = TaichiFitnessUtil._()..context = context;
  }

  static Widget Function(BuildContext context, Widget? child)? rootBuilder(
      {double? designWidth, double? designHeight}) {
    return _TaichiFitness.init(
        designHeight: designHeight, designWidth: designWidth);
  }

  double setWidth(double v) {
    if (context == null) {
      return v;
    }
    return v * context!.watch<FitnessController>().scaleWidth;
  }

  double setHeight(double v) {
    if (context == null) {
      return v;
    }
    return v * context!.watch<FitnessController>().scaleHeight;
  }

  double setSp(double v) {
    if (context == null) {
      return v;
    }
    return v * context!.watch<FitnessController>().scaleText;
  }
}
