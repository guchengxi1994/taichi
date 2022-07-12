// ignore_for_file: avoid_web_libraries_in_flutter, must_be_immutable

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:taichi_web_map/amap_loaderjs.dart';
import 'package:taichi_web_map/amap_web_controller.dart';
import 'package:taichi_web_map/amapjs.dart';
import 'dart:ui' as ui;

import 'package:taichi_web_map/poi_search_model.dart';

typedef MapViewCreatedCallback = void Function(AmapWebController controller);

class TaichiMapView extends StatefulWidget {
  TaichiMapView(
      {Key? key,
      required this.apiKey,
      required this.onCreate,
      this.onPoiSearched})
      : super(key: key);
  String apiKey;
  final MapViewCreatedCallback onCreate;
  final Function(List<PoiSearch>)? onPoiSearched;

  @override
  State<TaichiMapView> createState() => _TaichiMapViewState();
}

class _TaichiMapViewState extends State<TaichiMapView> {
  final List<String> plugins = <String>[
    'AMap.Geolocation',
    'AMap.PlaceSearch',
    'AMap.Scale',
    'AMap.ToolBar'
  ];

  late AMap _aMap;
  late String _divId;
  late DivElement _element;

  void _onPlatformViewCreated() {
    final Object promise = load(LoaderOptions(
      key: widget.apiKey,
      version: '1.4.15', // 2.0需要修改GeolocationOptions属性
      plugins: plugins,
    )) as Object;

    promiseToFuture<dynamic>(promise).then((dynamic value) {
      final MapOptions mapOptions = MapOptions(
        zoom: 11,
        resizeEnable: true,
      );

      /// 无法使用id https://github.com/flutter/flutter/issues/40080
      _aMap = AMap(_element, mapOptions);

      /// 加载插件
      _aMap.plugin(plugins, allowInterop(() {
        _aMap.addControl(Scale());
        _aMap.addControl(ToolBar());

        final AmapWebController controller = AmapWebController(_aMap, widget);

        widget.onCreate(controller);
      }));
    }, onError: (dynamic e) {
      debugPrint('初始化错误：$e');
    });
  }

  @override
  void dispose() {
    _aMap.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _divId = DateTime.now().toIso8601String();

    /// 先创建div并注册
    // ignore: undefined_prefixed_name,avoid_dynamic_calls
    ui.platformViewRegistry.registerViewFactory(_divId, (int viewId) {
      _element = DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.margin = '0';

      return _element;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: _divId,
      onPlatformViewCreated: (_) => _onPlatformViewCreated(),
    );
  }
}
