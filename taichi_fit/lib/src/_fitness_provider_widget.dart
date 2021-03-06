import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart';

import '_fitness_provider.dart';

class _TaichiFitness extends StatefulWidget {
  const _TaichiFitness({Key? key, required this.child, required this.context})
      : super(key: key);

  final Widget? child;
  final BuildContext? context;

  static Widget Function(BuildContext context, Widget? child)? init(
      {double? designWidth, double? designHeight, bool? onlyOnMobiles}) {
    return (BuildContext context, Widget? child) {
      return ChangeNotifierProvider(
          create: (_) => FitnessController()
            ..init(
                designHeight: designHeight,
                designWidth: designWidth,
                onlyOnMobiles: onlyOnMobiles),
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // debugPrint(MediaQuery.of(context).size.toString());
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
    if (TaichiFitnessUtil().context == null) {
      TaichiFitnessUtil.init(context);
    }

    return TaichiFitnessUtil().setWidth(toDouble());
  }

  double get w => TaichiFitnessUtil().setWidth(toDouble());

  double setHeight(BuildContext? context) {
    if (TaichiFitnessUtil().context == null) {
      TaichiFitnessUtil.init(context);
    }
    return TaichiFitnessUtil().setHeight(toDouble());
  }

  double get h => TaichiFitnessUtil().setHeight(toDouble());

  double setSp(BuildContext? context) {
    if (TaichiFitnessUtil().context == null) {
      TaichiFitnessUtil.init(context);
    }
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
/// current version 0.0.2-alpha+1
class TaichiFitnessUtil {
  BuildContext? context;
  static late TaichiFitnessUtil _instance;

  TaichiFitnessUtil._();
  factory TaichiFitnessUtil() {
    return _instance;
  }

  static void init(BuildContext? context) {
    // debugPrint(" ===== [call init function]");
    _instance = TaichiFitnessUtil._()..context = context;
  }

  static Widget Function(BuildContext context, Widget? child)? rootBuilder(
      {double? designWidth, double? designHeight, bool? onlyOnMobiles}) {
    return _TaichiFitness.init(
        designHeight: designHeight, designWidth: designWidth);
  }

  double setWidth(double v) {
    if (context == null) {
      // debugPrint(" <<<<<<< [context is null] ");
      return v;
    }

    if (!TaichiDevUtils.isMobile &&
        !context!.watch<FitnessController>().onlyOnMobiles) {
      return v;
    }

    // debugPrint("[origin width] ... $v");
    // debugPrint(
    //     "[ width factor] ... ${context!.watch<FitnessController>().scaleWidth}");
    // debugPrint(
    //     "[set width] ... ${v * context!.watch<FitnessController>().scaleWidth}");
    return v * context!.watch<FitnessController>().scaleWidth;
  }

  double setHeight(double v) {
    if (context == null) {
      return v;
    }

    if (!TaichiDevUtils.isMobile &&
        !context!.watch<FitnessController>().onlyOnMobiles) {
      if (!TaichiDevUtils.isMobile) {
        return v;
      }
    }
    // debugPrint("[origin height] ... $v");
    // debugPrint(
    //     "[ height factor] ... ${context!.watch<FitnessController>().scaleHeight}");
    // debugPrint(
    //     "[set height] ... ${v * context!.watch<FitnessController>().scaleHeight}");
    return v * context!.watch<FitnessController>().scaleHeight;
  }

  double setSp(double v) {
    if (context == null) {
      return v;
    }

    if (!TaichiDevUtils.isMobile &&
        !context!.watch<FitnessController>().onlyOnMobiles) {
      if (!TaichiDevUtils.isMobile) {
        return v;
      }
    }
    return v * context!.watch<FitnessController>().scaleText;
  }
}
