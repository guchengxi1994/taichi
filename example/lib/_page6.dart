import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      body: ProcessLoader.customWaveLoader(percentageValue: 30, duration: 2),
    );
  }
}
