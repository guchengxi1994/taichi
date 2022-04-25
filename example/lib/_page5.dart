import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

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
        child: Container(
          color: Colors.amber,
          child: TaichiGraph.uchiha(size: 100),
        ),
      ),
    );
  }
}
