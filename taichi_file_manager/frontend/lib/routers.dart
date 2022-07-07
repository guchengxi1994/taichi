import 'package:flutter/material.dart';
import 'package:taichi_file_manager/screens/splash_screen.dart';
import 'package:taichi_file_manager/widgets/future_builder.dart';
import 'package:taichi_file_manager/screens/main_screen.dart' deferred as main;
import 'package:taichi_file_manager/screens/bug_details_screen.dart'
    deferred as bugp;

class Routers {
  static const mainScreen = "/main";
  static const bug = "/bug";
  static const splash = "/splash";

  static Map<String, WidgetBuilder> routers = {
    mainScreen: (context) => FutureLoaderWidget(
        builder: (ctx) => main.MainScreen(),
        loadWidgetFuture: main.loadLibrary()),
    splash: (context) => const SplashScreen(),
    bug: (context) => FutureLoaderWidget(
        builder: (ctx) => bugp.BugDetailsScreen(),
        loadWidgetFuture: bugp.loadLibrary()),
  };
}
