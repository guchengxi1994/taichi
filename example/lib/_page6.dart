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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ProcessLoader.customWaveLoader(
                percentageValue: 30,
                maxVal: 80,
                backColor: const Color.fromARGB(255, 200, 43, 43),
                frontColor: const Color.fromARGB(255, 7, 255, 156)),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ProcessLoader.customWaveLoader(
                percentageValue: 30,
                duration: 2,
                maxVal: 80,
                backColor: Colors.white,
                frontColor: Colors.amber),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ProcessLoader.customWaveLoader(
                percentageValue: 30,
                duration: 5,
                maxVal: 100,
                backColor: const Color.fromARGB(255, 255, 255, 255),
                frontColor: const Color.fromARGB(255, 38, 68, 138)),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ProcessLoader.customWaveLoader(
                initialValue: 30,
                duration: 5,
                width: 160,
                height: 80,
                maxVal: 100,
                backColor: const Color.fromARGB(255, 255, 255, 255),
                frontColor: const Color.fromARGB(255, 38, 68, 138)),
          ),
        ],
      ),
    );
  }
}
