import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({Key? key, required this.datas})
      : assert(datas.length == 4),
        super(key: key);
  final List<PieData> datas;

  @override
  State<StatefulWidget> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.transparent,
      child: PieChart(
        dataMap: widget.datas.toMap(),
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: pieColors,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        // emptyColorGradient: ---Empty Color gradient---
      ),
    );
  }

  final List<Color> pieColors = const [
    Color(0xff0293ee),
    Color(0xfff8b250),
    Color(0xff845bef),
    Color(0xff13d38e)
  ];
}

class PieData {
  double value;
  String name;

  PieData({required this.value, required this.name});

  @override
  String toString() {
    return "$value%";
  }
}

extension PieListExtension on List<PieData> {
  Map<String, double> toMap() {
    Map<String, double> result = {};
    for (final i in this) {
      result[i.name] = i.value;
    }

    return result;
  }
}
