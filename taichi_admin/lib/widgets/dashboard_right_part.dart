// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import 'dashboard_custom_pie_chart.dart' deferred as pie
    show CustomPieChart, PieData;

class DashboardRightPart extends StatefulWidget {
  const DashboardRightPart({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<DashboardRightPart> createState() => _DashboardRightPartState();
}

class _DashboardRightPartState extends State<DashboardRightPart> {
  var loadPieFuture;
  @override
  void initState() {
    super.initState();
    loadPieFuture = pie.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureLoaderWidget(
            builder: (context) => pie.CustomPieChart(
                  datas: [
                    pie.PieData(name: "1", value: 40),
                    pie.PieData(name: "2", value: 30),
                    pie.PieData(name: "3", value: 20),
                    pie.PieData(name: "4", value: 10),
                  ],
                ),
            loadWidgetFuture: loadPieFuture),
        const SizedBox(
          height: 500,
        )
      ],
    );
  }
}
