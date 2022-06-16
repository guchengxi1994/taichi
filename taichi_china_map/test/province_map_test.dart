// ignore_for_file: avoid_relative_lib_imports, must_be_immutable, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:taichi_china_map/models.dart';
import 'package:taichi_china_map/painter.dart';

class ProvinceMapTest extends StatelessWidget {
  ProvinceMapTest({Key? key}) : super(key: key);

  late double _mapWidth = 1000;
  late double _mapHeight = 1000;

  final double _initScaleX = 1;
  final double _initScaleY = 1;

  double _mapScale = 1.0;
  double _mapOffsetX = 0;
  double _mapOffsetY = 0;
  double mapScalMax = 2.0;
  double mapScalMin = 1.0;

  late MapEntity _mapEntity;

  final String svgPath =
      "M421.139,189.75L420.782,186.894L419.95,184.989L425.045,182.863L425.426,181.18L424.23699999999997,176.413H422.56899999999996L415.90299999999996,172.964L412.21299999999997,176.654C412.21299999999997,176.654,411.08799999999997,183.239,411.381,181.534C411.66999999999996,179.82999999999998,407.688,185.822,407.688,185.822L407.094,190.108L407.926,192.371L412.807,191.537L416.5,192.608L418.284,190.941L421.139,189.75Z";

  @override
  Widget build(BuildContext context) {
    initMapData();
    print(_mapEntity.path!.getBounds().left);
    print(_mapEntity.path!.getBounds().top);

    return SizedBox(
      width: _mapWidth,
      height: _mapHeight,
      child: ClipRect(
          child: CustomPaint(
        painter: MapPainter(
            offsetX: _mapOffsetX - _mapEntity.path!.getBounds().left,
            offsetY: _mapOffsetY - _mapEntity.path!.getBounds().top,
            scale: _mapScale,
            mapEntityList: [_mapEntity]),
      )),
    );
  }

  void initMapData() {
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
      ..name = "北京";

    // print(_mapEntity.path.toString());
  }
}
