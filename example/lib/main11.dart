import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

void main() => runApp(
      const MyApp(),
    );

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(100),
                child: CustomTooltip(
                  tooltip: Container(
                    color: Colors.transparent,
                    // color: Colors.blue,
                    width: 100,
                  ),
                  child: const Text("this is for test"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: CustomTooltip(
                  howToolTipShow: HowToolTipShow.onMouseHover,
                  tooltip: Container(
                    color: Colors.transparent,
                    // color: Colors.blue,
                    width: 100,
                  ),
                  child: const Text("this is for test2"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
