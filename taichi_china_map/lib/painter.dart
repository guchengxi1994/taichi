import 'package:flutter/material.dart';

import 'models.dart';

class MapPainter extends CustomPainter {
  Paint mapPaint = Paint()
    ..color = Colors.blue
    ..isAntiAlias = true
    ..strokeWidth = 1;
  double offsetX;
  double offsetY;
  double scale;
  List<MapEntity> mapEntityList;

  MapPainter({
    required this.offsetX,
    required this.offsetY,
    required this.mapEntityList,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale);
    for (var mapEntity in mapEntityList) {
      if (mapEntity.isSelected!) {
        mapPaint.color = Colors.green;
        mapPaint.style = PaintingStyle.fill;
      } else {
        mapPaint.color = Colors.blue;
        mapPaint.style = PaintingStyle.stroke;
      }
      canvas.drawPath(mapEntity.path!, mapPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AreaPainter extends CustomPainter {
  Paint mapPaint = Paint()
    ..color = Colors.blue
    ..isAntiAlias = true
    ..strokeWidth = 1;
  double offsetX;
  double offsetY;
  double scale;
  List<MapEntity> mapEntityList;

  AreaPainter({
    required this.offsetX,
    required this.offsetY,
    required this.mapEntityList,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (scale != 1) {
      canvas.scale(scale);
      canvas.translate(offsetX, offsetY);
    } else {
      canvas.translate(offsetX, offsetY);
      canvas.scale(scale);
    }

    for (var mapEntity in mapEntityList) {
      if (mapEntity.isSelected!) {
        mapPaint.color = Colors.green;
        mapPaint.style = PaintingStyle.fill;
      } else {
        mapPaint.color = Colors.blue;
        mapPaint.style = PaintingStyle.stroke;
      }
      canvas.drawPath(mapEntity.path!, mapPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
