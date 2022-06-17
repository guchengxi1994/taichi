// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart' show TaichiDevUtils;
import 'package:taichi_china_map/default_indicator.dart';

import 'area_overlay.dart';
import 'constrants.dart';
import 'models.dart';
import 'painter.dart';

typedef AreaCallBack = void Function(String? s);

/// modified from https://blog.csdn.net/LZ511321/article/details/117521633

//中国地图控件
class ChinaMap extends StatefulWidget {
  const ChinaMap(
      {Key? key,
      this.showNames = true,
      this.onClick,
      this.overlay,
      this.toLeft = 0,
      this.toTop = 0,
      this.mapColor = const {},
      this.indicator,
      this.mapScale = 1.0,
      this.isDisplayOverlay = true})
      : super(key: key);

  /// 是否展示地区名
  final bool showNames;

  /// 点击地区的回调
  final AreaCallBack? onClick;

  /// only works on desktops
  ///
  /// 展示自定义overlay
  ///
  /// 需 `isDisplayOverlay` 参数为true
  final Widget? overlay;
  final double toTop;
  final double toLeft;

  /// 地图显示的数值
  ///
  /// 例如 {"北京":Colors.red}
  final Map<String, Color> mapColor;

  /// 地图标识
  final Widget? indicator;

  /// 地图尺寸
  final double mapScale;

  /// 是否显示Overlay
  final bool isDisplayOverlay;

  @override
  State<StatefulWidget> createState() {
    return _ChinaMapState();
  }
}

class _ChinaMapState extends State<ChinaMap>
    with AutomaticKeepAliveClientMixin {
  // ignore: avoid_init_to_null
  late OverlayEntry? _overlayEntry = null;

  /// 计算地图边界
  /// 1.黑龙江是中国最东，最北的省份
  /// 2.新疆是中国最西的省份
  /// 3.海南是中国最南的省份
  /// <p/>
  /// 地图边界为
  /// 0点                  1点
  /// 0,0------------------heilongjiang.right,0
  /// |                      |
  /// |                      |
  /// 0,hainan.bottom------heilongjiang.right,hainan.bottom
  /// 3点                   2点
  /// 地图宽度--->heilongjiang.right
  /// 地图高度--->hainan.bottom
  late double _mapWidth;
  late double _mapHeight;

  //初始缩放系数
  final double _initScaleX = 1;
  final double _initScaleY = 1;

  late double _mapScale = widget.mapScale;
  double _mapOffsetX = 0;
  double _mapOffsetY = 0;
  late Offset _lastOffset;
  double mapScalMax = 2.0;
  double mapScalMin = 1.0;
  double _lastEndMapScale = 1.0;
  double _lastMapScale = 1.0;
  double _nowMapScale = 1.0;
  final List<String> _cityNameList = AreaNames;

  List<Widget> cityNameListWidget = [];
  final List<MapEntity> _mapEntityList = [];

  @override
  void initState() {
    super.initState();
    _initMapData();
  }

  //根据svgPaths 初始化
  void _initMapData() {
    _mapEntityList.clear();
    // _cityNameList = AreaNames;
    for (int svgPathListIndex = 0;
        svgPathListIndex < svgPathList.length;
        svgPathListIndex++) {
      String svgPath = svgPathList[svgPathListIndex];
      int svgIndex = 0;
      int svgLength = svgPath.length;
      Path paintPath = Path();
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

      // ignore: no_leading_underscores_for_local_identifiers
      var _color = widget.mapColor[_cityNameList[svgPathListIndex]];

      if (null == _color) {
        _mapEntityList.add(MapEntity()
          ..path = paintPath
          ..isSelected = false
          ..name = _cityNameList[svgPathListIndex]);
      } else {
        _mapEntityList.add(MapEntity()
          ..path = paintPath
          ..isSelected = true
          ..areaColor = _color
          ..name = _cityNameList[svgPathListIndex]);
      }

      //最下方城市
      if (_cityNameList[svgPathListIndex] == "海南") {
        _mapHeight = paintPath.getBounds().bottom;
      }

      //最右方城市
      if (_cityNameList[svgPathListIndex] == "黑龙江") {
        _mapWidth = paintPath.getBounds().right;
      }
    }
  }

  //处理点击事件
  void _dealClickEvent(TapUpDetails details) {
    //寻找点击范围的城市
    for (var mapEntity in _mapEntityList) {
      if (mapEntity.path!.contains(Offset(
          (details.localPosition.dx - _mapOffsetX) / _mapScale,
          (details.localPosition.dy - _mapOffsetY) / _mapScale))) {
        if (widget.onClick != null) {
          widget.onClick!(mapEntity.name!);
        } else {
          mapEntity.isSelected = true;
        }
      } else {
        if (widget.onClick == null) {
          mapEntity.isSelected = false;
        }
      }
    }
    setState(() {});
  }

  //处理地图移动、缩放事件
  void _dealScaleEvent(ScaleUpdateDetails details) {
    _nowMapScale = details.scale;

    if (_nowMapScale == 1.0) {
      //未缩放时，只处理位移
      double offsetX = details.localFocalPoint.dx - _lastOffset.dx;
      double offsetY = details.localFocalPoint.dy - _lastOffset.dy;
      //控制边界
      if (offsetX <= -(_mapWidth * (_lastEndMapScale - 1) + _mapOffsetX)) {
        offsetX = -(_mapWidth * (_lastEndMapScale - 1) + _mapOffsetX);
      } else if (offsetX >= -_mapOffsetX) {
        offsetX = -_mapOffsetX;
      }

      if (offsetY <= -(_mapHeight * (_lastEndMapScale - 1) + _mapOffsetY)) {
        offsetY = -(_mapHeight * (_lastEndMapScale - 1) + _mapOffsetY);
      } else if (offsetX >= -_mapOffsetY) {
        offsetY = -_mapOffsetY;
      }
      _mapOffsetX += offsetX;
      _mapOffsetY += offsetY;
      _lastOffset = details.localFocalPoint;
    } else {
      _mapScale = (_nowMapScale * _lastEndMapScale).clamp(1.0, 2.0);
      double shouldOffsetX = (_mapScale - _lastMapScale) * _mapWidth / 2 -
          _mapOffsetX * (_mapScale - _lastMapScale);
      double shouldOffsetY = (_mapScale - _lastMapScale) * _mapHeight / 2 -
          _mapOffsetY * (_mapScale - _lastMapScale);
      _mapOffsetX += -shouldOffsetX;
      _mapOffsetY += -shouldOffsetY;
      _lastMapScale = _mapScale;
    }
    setState(() {});
  }

  void _dealScaleEndEvent() {
    _lastEndMapScale = (_nowMapScale * _lastEndMapScale).clamp(1.0, 2.0);
    if (_mapScale == 1.0) {
      //精度矫正
      _mapOffsetX = 0.0;
      _mapOffsetY = 0.0;
    }
    setState(() {});
  }

  late String onMouseChangeAreaName = "";

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (TaichiDevUtils.isMobile) {
      return GestureDetector(
          onTapUp: (value) {
            _dealClickEvent(value);
          },
          child: Container(
            color: Colors.transparent,
            width: _mapWidth,
            height: _mapHeight,
            child: ClipRect(
              child: CustomPaint(
                painter: MapPainter(
                    offsetX: _mapOffsetX,
                    offsetY: _mapOffsetY,
                    scale: _mapScale,
                    mapEntityList: _mapEntityList),
                child: widget.showNames
                    ? Stack(
                        children: _cityNameListWidget(),
                      )
                    : null,
              ),
            ),
          ));
    }

    return MouseRegion(
      onExit: (event) {
        try {
          _overlayEntry?.remove();
        } catch (_) {}
      },
      onHover: (event) {
        if (!widget.isDisplayOverlay) {
          return;
        }

        // debugPrint("[mouse region event]:$event");

        var initAreaName = "";
        for (var mapEntity in _mapEntityList) {
          if (mapEntity.path!.contains(Offset(
              (event.position.dx - _mapOffsetX - widget.toLeft) / _mapScale,
              (event.position.dy - _mapOffsetY - widget.toTop) / _mapScale))) {
            initAreaName = mapEntity.name!;
            break;
          }
        }

        if (onMouseChangeAreaName != initAreaName) {
          onMouseChangeAreaName = initAreaName;

          try {
            _overlayEntry?.remove();
          } catch (_) {}

          // debugPrint("[mouse region currentAreaName]:$onMouseChangeAreaName");
          var svgIndex = _cityNameList.indexOf(onMouseChangeAreaName);
          // print(onMouseChangeAreaName);
          // print(svgIndex);

          if (svgIndex != -1) {
            _overlayEntry = OverlayEntry(builder: (context) {
              if (widget.overlay != null) {
                return widget.overlay!;
              }
              // print("aaaaaaaaaaaaaaa");
              return Positioned(
                  left: (event.position.dx - _mapOffsetX) / _mapScale,
                  top: (event.position.dy - _mapOffsetY) / _mapScale,
                  child: AreaOverlayWidget(
                    svgPath: svgPathList[svgIndex],
                    areaName: onMouseChangeAreaName,
                  ));
            });

            Overlay.of(context)?.insert(_overlayEntry!);
            // print("bbbbbbbbbbbbbbbbbb");
          }

          return;
        }
        if (initAreaName == "" && _overlayEntry != null) {
          try {
            _overlayEntry?.remove();
          } catch (_) {}
          return;
        }
      },
      child: GestureDetector(
          onTapUp: (value) {
            _dealClickEvent(value);
          },
          onScaleStart: (value) {
            _lastOffset = value.localFocalPoint;
          },
          onScaleUpdate: (value) {
            _dealScaleEvent(value);
          },
          onScaleEnd: (value) {
            _dealScaleEndEvent();
          },
          child: Container(
            color: Colors.transparent,
            width: _mapWidth,
            height: _mapHeight,
            child: ClipRect(
              child: CustomPaint(
                painter: MapPainter(
                    offsetX: _mapOffsetX,
                    offsetY: _mapOffsetY,
                    scale: _mapScale,
                    mapEntityList: _mapEntityList),
                child: widget.showNames
                    ? Stack(
                        children: _cityNameListWidget(),
                      )
                    : Stack(
                        children: [_indicator()],
                      ),
              ),
            ),
          )),
    );
  }

  Widget _indicator() {
    double top = _mapScale *
            _mapEntityList
                .firstWhere((element) => element.name == "西藏")
                .path!
                .getBounds()
                .bottom +
        10;

    if (widget.indicator == null) {
      return Positioned(
          left: 0,
          top: top,
          child: DefaultIndicator(
            models: widget.mapColor.toIndicator(),
            mapScale: _mapScale,
          ));
    } else {
      return Positioned(left: 0, top: top, child: widget.indicator!);
    }
  }

  List<Widget> _cityNameListWidget() {
    cityNameListWidget.clear();
    for (var element in _mapEntityList) {
      TextPainter textPainter =
          calculateText(element.name!, 12.0, FontWeight.normal, 1);
      double textWidth = textPainter.width;
      double textHeight = textPainter.height;
      Rect mapBounds = element.path!.getBounds();
      double textPositionX =
          (mapBounds.right - mapBounds.left) * _mapScale / 2 +
              mapBounds.left * _mapScale -
              textWidth / 2;
      double textPositionY =
          (mapBounds.bottom - mapBounds.top) * _mapScale / 2 +
              mapBounds.top * _mapScale -
              textHeight / 2;
      //cityname 位置微调
      double offsetX = textPositionX + _mapOffsetX;
      double offsetY = textPositionY + _mapOffsetY;

      if (element.name == "甘肃") {
        offsetY -= 20 * _mapScale;
        offsetX -= 20 * _mapScale;
      } else if (element.name == "内蒙") {
        offsetY += 23 * _mapScale;
        offsetX += 23 * _mapScale;
      } else if (element.name == "陕西") {
        offsetY += 12 * _mapScale;
        offsetX += 6 * _mapScale;
      } else if (element.name == "上海") {
        offsetX += 15 * _mapScale;
      } else if (element.name == "黑龙江") {
        offsetY += 8 * _mapScale;
        offsetX += 8 * _mapScale;
      } else if (element.name == "河北") {
        offsetY += 8 * _mapScale;
        offsetX -= 8 * _mapScale;
      } else if (element.name == "天津") {
        offsetX += 15 * _mapScale;
        offsetY += 6 * _mapScale;
      } else if (element.name == "江苏") {
        offsetX += 6 * _mapScale;
      } else if (element.name == "澳门") {
        offsetY += 10 * _mapScale;
      } else if (element.name == "香港") {
        offsetX += 18 * _mapScale;
      } else if (element.name == "广东") {
        offsetY -= 6 * _mapScale;
      }

      cityNameListWidget.add(Positioned(
        left: offsetX,
        top: offsetY,
        child: Text(
          element.name!,
          style: const TextStyle(fontSize: 9, color: Colors.black),
        ),
      ));
    }

    cityNameListWidget.add(_indicator());

    return cityNameListWidget;
  }

  TextPainter calculateText(
      String value, fontSize, FontWeight fontWeight, int maxLines) {
    TextPainter painter = TextPainter(

        ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
        locale: Localizations.localeOf(context),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            )));
    painter.layout(maxWidth: 80);
    return painter;
  }

  @override
  bool get wantKeepAlive => false;
}
