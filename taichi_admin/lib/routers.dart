import 'package:flutter/material.dart';
import 'package:taichi_admin/screens/splash_screen.dart';
import 'package:taichi_admin/screens/main_screen.dart' deferred as main;
import 'package:taichi_admin/widgets/future_builder.dart';

class Routers {
  static const splash = "/splash";
  static const mainScreen = "/main";

  static Map<String, WidgetBuilder> routers = {
    splash: (context) => const SplashScreen(),
    mainScreen: (context) => FutureLoaderWidget(
        builder: (context) => main.MainScreen(),
        loadWidgetFuture: main.loadLibrary()),
  };
}
