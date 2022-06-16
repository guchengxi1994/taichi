import 'dart:math';

import 'package:flutter/material.dart';

import 'models.dart';
import 'painter.dart';

// ignore: must_be_immutable
class AreaOverlayWidget extends StatelessWidget {
  AreaOverlayWidget({Key? key, required this.svgPath, required this.areaName})
      : super(key: key);
  final String svgPath;
  final String areaName;

  late final double _mapWidth = 300;
  late final double _mapHeight = 300;

  final double _initScaleX = 1;
  final double _initScaleY = 1;

  double _mapScale = 1.0;
  final double _mapOffsetX = 0;
  final double _mapOffsetY = 0;

  late MapEntity _mapEntity;

  void initData() {
    int svgLength = svgPath.length;
    Path paintPath = Path();
    int svgIndex = 0;
    List<int> cmdPositionList = [];
    while (svgIndex < svgLength) {
      String charResult = svgPath.substring(svgIndex, svgIndex + 1);
      if (charResult.contains(RegExp(r'[A-z]'))) {
        cmdPositionList.add(svgIndex);
      }
      svgIndex++;
    }

    late double lastPointX;
    late double lastPointY;
    for (int i = 0; i < cmdPositionList.length; i++) {
      int cmdIndex = cmdPositionList[i];
      String pointString;
      if (i < cmdPositionList.length - 1) {
        pointString = svgPath.substring(cmdIndex + 1, cmdPositionList[i + 1]);
      } else {
        pointString = svgPath.substring(cmdIndex + 1, svgPath.length);
      }

      List<String> pointList = pointString.split(",");
      switch (svgPath.substring(cmdIndex, cmdIndex + 1)) {
        case 'm':
        case 'M':
          {
            lastPointX = double.parse(pointList[0]) * _initScaleX;
            lastPointY = double.parse(pointList[1]) * _initScaleY;
            paintPath.moveTo(lastPointX, lastPointY);
          }
          break;
        case "l":
        case "L":
          {
            lastPointX = double.parse(pointList[0]) * _initScaleX;
            lastPointY = double.parse(pointList[1]) * _initScaleY;
            paintPath.lineTo(lastPointX, lastPointY);
          }
          break;
        case 'h':
        case 'H':
          {
            lastPointX = double.parse(pointList[0]) * _initScaleX;
            paintPath.lineTo(lastPointX, lastPointY);
          }
          break;
        case 'v':
        case 'V':
          {
            lastPointY = double.parse(pointList[0]) * _initScaleY;
            paintPath.lineTo(lastPointX, lastPointY);
          }
          break;
        case 'c':
        case 'C':
          {
            //3次贝塞尔曲线
            lastPointX = double.parse(pointList[4]) * _initScaleX;
            lastPointY = double.parse(pointList[5]) * _initScaleY;
            paintPath.cubicTo(
                double.parse(pointList[0]) * _initScaleX,
                double.parse(pointList[1]) * _initScaleY,
                double.parse(pointList[2]) * _initScaleX,
                double.parse(pointList[3]) * _initScaleY,
                lastPointX,
                lastPointY);
          }
          break;
        case 's':
        case 'S':
          {
            paintPath.cubicTo(
                lastPointX,
                lastPointY,
                double.parse(pointList[0]) * _initScaleX,
                double.parse(pointList[1]) * _initScaleY,
                double.parse(pointList[2]) * _initScaleX,
                double.parse(pointList[3]) * _initScaleY);
            lastPointX = double.parse(pointList[2]) * _initScaleX;
            lastPointY = double.parse(pointList[3]) * _initScaleY;
          }
          break;
        case 'q':
        case 'Q':
          {
            lastPointX = double.parse(pointList[2]) * _initScaleX;
            lastPointY = double.parse(pointList[3]) * _initScaleY;
            paintPath.quadraticBezierTo(
                double.parse(pointList[0]) * _initScaleX,
                double.parse(pointList[1]) * _initScaleY,
                double.parse(pointList[2]) * _initScaleX,
                double.parse(pointList[3]) * _initScaleY);
          }

          break;
        case 't':
        case 'T':
          {
            paintPath.quadraticBezierTo(
                lastPointX,
                lastPointY,
                double.parse(pointList[0]) * _initScaleX,
                double.parse(pointList[1]) * _initScaleY);
            lastPointX = double.parse(pointList[0]) * _initScaleX;
            lastPointY = double.parse(pointList[1]) * _initScaleY;
          }
          break;
        case 'a':
        case 'A':
          {
            //画弧
          }
          break;
        case 'z':
        case 'Z':
          {
            paintPath.close();
          }
          break;
      }
    }

    _mapEntity = MapEntity()
      ..path = paintPath
      ..isSelected = false
      ..name = "areaName";
  }

  @override
  Widget build(BuildContext context) {
    initData();
    var left = _mapEntity.path!.getBounds().left;
    var top = _mapEntity.path!.getBounds().top;
    var bottom = _mapEntity.path!.getBounds().bottom;
    var right = _mapEntity.path!.getBounds().right;

    // debugPrint("[left]:$left");
    // debugPrint("[top]:$top");
    // debugPrint("[bottom]:$bottom");
    // debugPrint("[right]:$right");

    _mapScale =
        _mapScale * 0.9 * min(300 / (right - left), 300 / (bottom - top));

    // debugPrint("[_mapScale]:$_mapScale");

    return Container(
      padding: const EdgeInsets.all(20),
      // color: Colors.red,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2, //阴影范围
              spreadRadius: 1, //阴影浓度
              color: Colors.grey, //阴影颜色
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: _mapWidth,
      height: _mapHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            painter: AreaPainter(
                offsetX: _mapOffsetX - left,
                offsetY: _mapOffsetY - top,
                scale: _mapScale,
                mapEntityList: [_mapEntity]),
          )
        ],
      ),
    );
  }
}
