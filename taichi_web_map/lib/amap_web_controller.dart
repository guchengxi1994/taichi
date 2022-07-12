import 'package:flutter/foundation.dart';
import 'package:js/js.dart';
import 'package:taichi_web_map/amapjs.dart';
import 'package:taichi_web_map/map_view.dart';
import 'package:taichi_web_map/poi_search_model.dart';

class AmapWebController {
  AmapWebController(this._aMap, this._widget) {
    _placeSearchOptions = PlaceSearchOptions(
      extensions: 'all',
      type: _kType,
      pageIndex: 1,
      pageSize: 50,
    );

    _aMap.on('click', allowInterop((event) {
      //_aMap.resize(); /// 2.0无法自适应容器大小，需手动调用触发计算。
      searchNearBy(LngLat(event.lnglat.getLng(), event.lnglat.getLat()));
    }));

    /// 定位插件初始化
    _geolocation = Geolocation(GeolocationOptions(
      timeout: 15000,
      buttonPosition: 'RT',
      buttonOffset: Pixel(10, 20),
      zoomToAccuracy: true,
      enableHighAccuracy: true,
    ));

    _aMap.addControl(_geolocation);
    location();
  }

  final TaichiMapView _widget;
  final AMap _aMap;
  late Geolocation _geolocation;
  MarkerOptions? _markerOptions;
  late PlaceSearchOptions _placeSearchOptions;
  static const String _kType =
      '010000|010100|020000|030000|040000|050000|050100|060000|060100|060200|060300|060400|070000|080000|080100|080300|080500|080600|090000|090100|090200|090300|100000|100100|110000|110100|120000|120200|120300|130000|140000|141200|150000|150100|150200|160000|160100|170000|170100|170200|180000|190000|200000';

  /// city：cityName（中文或中文全拼）、cityCode均可
  Future<void> search(String keyWord, {city = ''}) async {
    final PlaceSearch placeSearch = PlaceSearch(_placeSearchOptions);
    placeSearch.setCity(city);
    placeSearch.search(keyWord, searchResult);
    return Future.value();
  }

  Future<void> move(String lat, String lon) async {
    final LngLat lngLat = LngLat(double.parse(lon), double.parse(lat));
    _aMap.setCenter(lngLat);
    if (_markerOptions == null) {
      _markerOptions = MarkerOptions(
          position: lngLat,
          icon: AMapIcon(IconOptions(
            size: Size(26, 34),
            imageSize: Size(26, 34),
            image:
                'https://a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png',
          )),
          offset: Pixel(-13, -34),
          anchor: 'bottom-center');
    } else {
      _markerOptions?.position = lngLat;
    }
    _aMap.clearMap();
    _aMap.add(Marker(_markerOptions!));
    return Future.value();
  }

  Future<void> location() async {
    _geolocation.getCurrentPosition(allowInterop((status, result) {
      if (status == 'complete') {
        _aMap.setZoom(17);
        _aMap.setCenter(result.position);
        searchNearBy(result.position);
      } else {
        /// 异常查询：https://lbs.amap.com/faq/js-api/map-js-api/position-related/43361
        /// Get geolocation time out：浏览器定位超时，包括原生的超时，可以适当增加超时属性的设定值以减少这一现象，
        /// 另外还有个别浏览器（如google Chrome浏览器等）本身的定位接口是黑洞，通过其请求定位完全没有回应，也会超时返回失败。
        debugPrint(result.message);
      }
    }));
    return Future.value();
  }

  /// 根据经纬度搜索
  void searchNearBy(LngLat lngLat) {
    final PlaceSearch placeSearch = PlaceSearch(_placeSearchOptions);
    placeSearch.searchNearBy('', lngLat, 2000, searchResult);
  }

  Function(String status, SearchResult result) get searchResult =>
      allowInterop((status, result) {
        final List<PoiSearch> list = <PoiSearch>[];
        if (status == 'complete') {
          // ignore: avoid_function_literals_in_foreach_calls
          result.poiList?.pois?.forEach((dynamic poi) {
            if (poi is Poi) {
              final PoiSearch poiSearch = PoiSearch(
                cityCode: poi.citycode,
                cityName: poi.cityname,
                provinceName: poi.pname,
                title: poi.name,
                adName: poi.adname,
                provinceCode: poi.pcode,
                latitude: poi.location.getLat().toString(),
                longitude: poi.location.getLng().toString(),
              );
              list.add(poiSearch);
            }
          });
        } else if (status == 'no_data') {
          debugPrint('无返回结果');
        } else {
          debugPrint(result.toString());
        }

        /// 默认点移动到搜索结果的第一条
        if (list.isNotEmpty) {
          _aMap.setZoom(17);
          move(list[0].latitude!, list[0].longitude!);
        }

        if (_widget.onPoiSearched != null) {
          _widget.onPoiSearched!(list);
        }
      });
}
