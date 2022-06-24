import 'package:flutter/material.dart';

class IndicatorModel<T> {
  String areaName;
  Color color;
  T? data;

  IndicatorModel({required this.areaName, required this.color, this.data});
}

// ignore: must_be_immutable
class DefaultIndicator extends StatelessWidget {
  DefaultIndicator({Key? key, required this.models, required this.mapScale})
      : super(key: key);
  final ScrollController controller = ScrollController();
  final double mapScale;
  List<IndicatorModel> models;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: mapScale * 200,
        height: 100,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: models.map((e) {
              return Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: e.color,
                    ),
                    Text(e.areaName),
                    if (e.data != null) Text(e.data.toString())
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

extension ToIndicator on Map<String, Color> {
  List<IndicatorModel> toIndicator() {
    List<IndicatorModel> results = [];
    for (final i in entries) {
      results.add(IndicatorModel(areaName: i.key, color: i.value));
    }

    return results;
  }
}
