// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_admin/app_style.dart';
import 'package:taichi_admin/controllers/menu_controller.dart';
import 'package:taichi_admin/utils/common.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import 'package:taichi_china_map/lib.dart' deferred as chinamap;
import '../models/card_data.dart';
import 'darshboard_custom_card.dart' deferred as card;

class DashboardLeftPart extends StatefulWidget {
  const DashboardLeftPart({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<DashboardLeftPart> createState() => _DashboardLeftPartState();
}

class _DashboardLeftPartState extends State<DashboardLeftPart> {
  var loadCardFuture;
  var loadChinaMapFuture;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    loadCardFuture = card.loadLibrary();
    loadChinaMapFuture = chinamap.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 8;
    if (widget.type == ScreenType.desktop) {
      var d = (MediaQuery.of(context).size.width - 300) * 0.75 - 4 * 200;
      if (d > 0) {
        spacing = d / 5;
      }
    } else if (widget.type == ScreenType.tablet) {
      spacing = (MediaQuery.of(context).size.width - 4 * 125) / 5;
    }

    widgets = List.generate(4, (index) {
      return FutureLoaderWidget(
          builder: (context) => card.CustomCard<CardData>(
                type: widget.type,
                data: CardData(description: "test", index: index),
              ),
          loadWidgetFuture: loadCardFuture);
    }).toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureLoaderWidget(
            builder: (context) {
              if (widget.type == ScreenType.desktop) {
                if (context.watch<MenuController>().isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: chinamap.ChinaMap(
                      onClick: (s) {
                        debugPrint("[current area]:$s");
                      },
                      toLeft: 20 + AppStyle.sidemenuWidth,
                      toTop: 20 + AppStyle.appbarHeight,
                    ),
                  );
                }

                return chinamap.ChinaMap(
                  toLeft: AppStyle.collapseSidemenuWidth,
                  toTop: AppStyle.appbarHeight,
                );
              } else {
                return chinamap.ChinaMap(
                  toTop: AppStyle.appbarHeight,
                );
              }
            },
            loadWidgetFuture: loadChinaMapFuture),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: spacing,
          // runSpacing: 4.0,
          children: widgets,
        ),
      ],
    );
  }
}
