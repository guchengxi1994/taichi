/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 12:59:38
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-04 09:39:46
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/fit/_fitness_provider.dart';

const _fitnessVersion = "0.0.1-alpha";

class TaichiFitness extends StatefulWidget {
  const TaichiFitness({Key? key, required this.child, required this.context})
      : super(key: key);

  final Widget? child;
  final BuildContext? context;

  static String get version => _fitnessVersion;

  static Widget Function(BuildContext context, Widget? child)? init(
      {double? designWidth, double? designHeight}) {
    return (BuildContext context, Widget? child) {
      return ChangeNotifierProvider(
          create: (_) => FitnessController()
            ..init(designHeight: designHeight, designWidth: designWidth),
          child: TaichiFitness(
            context: context,
            child: child,
          ));
    };
  }

  @override
  State<TaichiFitness> createState() => _TaichiFitnessState();
}

class _TaichiFitnessState extends State<TaichiFitness> {
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
  double w({BuildContext? context}) {
    _TaichiFitnessUtil.init(context);
    return _TaichiFitnessUtil().setWidth(toDouble());
  }

  double h({BuildContext? context}) {
    _TaichiFitnessUtil.init(context);
    return _TaichiFitnessUtil().setHeight(toDouble());
  }
}

/// v0.0.1-alpha
/// ``` dart
/// class _TaichiFitnessUtil {
///   BuildContext? context;
///   _TaichiFitnessUtil(this.context);

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
class _TaichiFitnessUtil {
  BuildContext? context;
  static late _TaichiFitnessUtil _instance;

  _TaichiFitnessUtil._();
  factory _TaichiFitnessUtil() {
    return _instance;
  }

  static void init(BuildContext? context) {
    _instance = _TaichiFitnessUtil._()..context = context;
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
}
