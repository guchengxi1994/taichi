import 'package:flutter/material.dart';
import 'package:taichi_admin/app_style.dart';

import '../models/card_data.dart';
import '../utils/common.dart';

class CustomCard<T extends CardData> extends StatelessWidget {
  const CustomCard({Key? key, required this.type, required this.data})
      : super(key: key);
  final ScreenType type;
  final T data;

  @override
  Widget build(BuildContext context) {
    if (type == ScreenType.desktop) {
      return Card(
        child: SizedBox(
          width: AppStyle.desktopCardWidth,
          height: AppStyle.desktopCardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.icon ??
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: Icon(Icons.computer),
                  ),
            ],
          ),
        ),
      );
    } else if (ScreenType.tablet == type) {
      return Card(
        child: SizedBox(
          width: AppStyle.tabletCardWidth,
          height: AppStyle.tabletCardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.icon ??
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: Icon(Icons.padding),
                  ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        child: SizedBox(
          width: AppStyle.mobileCardWidth,
          height: AppStyle.mobileCardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.icon ??
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: Icon(Icons.phone),
                  ),
            ],
          ),
        ),
      );
    }
  }
}
