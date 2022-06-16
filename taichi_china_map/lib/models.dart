import 'package:flutter/material.dart';

//封装地图实体类
class MapEntity {
  String? name;
  Path? path;
  bool? isSelected;

  MapEntity({this.isSelected, this.name, this.path});
}
