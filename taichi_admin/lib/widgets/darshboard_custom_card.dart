import 'package:flutter/material.dart';

import '../utils/common.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.type, required this.data})
      : super(key: key);
  final ScreenType type;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    if (type == ScreenType.desktop) {
      return Card(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            children: [Text(data.toString())],
          ),
        ),
      );
    } else if (ScreenType.tablet == type) {
      return Card(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            children: [Text(data.toString())],
          ),
        ),
      );
    } else {
      return Card(
        child: SizedBox(
          width: 50,
          height: 100,
          child: Column(
            children: [Text(data.toString())],
          ),
        ),
      );
    }
  }
}
