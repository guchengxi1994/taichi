// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/loader/_extension.dart';

import 'package:vector_math/vector_math.dart' as vector;

import '_theme.dart';
import 't_loader_controller.dart';

part './t_wave_loader.dart';

class ProcessLoader {
  static Widget customWaveLoader({
    double initialValue = 0,
    double width = 80,
    double height = 160,
    Color frontColor = LoaderTheme.nearlyDarkBlue,
    Color backColor = Colors.blue,
    double? duration,
    double? percentageValue,
    double maxVal = 100,
  }) {
    return ChangeNotifierProvider(
      create: (_) => ProcessLoaderController()
        ..setInitialValue(initialValue)
        ..setMax(max: maxVal),
      child: _WaveView(
        width: width,
        height: height,
        frontColor: frontColor,
        backColor: backColor,
        duration: duration,
        percentageValue: duration != null ? initialValue : percentageValue,
      ),
    );
  }
}
