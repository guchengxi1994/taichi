import 'package:flutter/material.dart';
import 'package:taichi_admin/app_style.dart';

class CardData {
  int index;
  Widget? icon;
  Color color;
  VoidCallback? onTap;
  String description;

  CardData(
      {required this.index,
      required this.description,
      this.color = AppStyle.spacer,
      this.icon,
      this.onTap});
}
