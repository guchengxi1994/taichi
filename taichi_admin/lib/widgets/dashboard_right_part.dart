// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import 'dashboard_custom_pie_chart.dart' deferred as pie;

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
      children: [
        FutureLoaderWidget(
            builder: (context) => pie.CustomPieChart(
                  datas: [
                    pie.PieData(value: 40),
                    pie.PieData(value: 30),
                    pie.PieData(value: 20),
                    pie.PieData(value: 10),
                  ],
                ),
            loadWidgetFuture: loadPieFuture)
      ],
    );
  }
}
