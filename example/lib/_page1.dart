import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

// ignore: must_be_immutable
class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  TaichiGraphStyle style = TaichiGraphStyle(
    color1: Colors.amber,
    color2: Colors.indigo,
    dotFactor: 0.15,
    dotColor1: Colors.brown,
    dotColor2: Colors.deepOrange,
    size: 400,
    angle: 45,
  );

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Simple:",
              style: TextStyle(fontSize: 20),
            ),
            TaichiGraph.simple(size: 300),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Custom:",
              style: TextStyle(fontSize: 20),
            ),
            TaichiGraph.custom(
              size: 300,
              color1: Colors.amber,
              color2: Colors.indigo,
              angle: 90,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "FromStyle:",
              style: TextStyle(fontSize: 20),
            ),
            TaichiGraph.fromStyle(style),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
