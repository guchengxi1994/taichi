import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

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
      body: Center(
        child:
            TaichiGraph.splited(color: Colors.blue, size: 500, gradient: true),
      ),
    );
  }
}
