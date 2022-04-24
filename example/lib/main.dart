import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    TaichiGraphStyle style = TaichiGraphStyle(
      color1: Colors.amber,
      color2: Colors.indigo,
      dotFactor: 0.15,
      dotColor1: Colors.brown,
      dotColor2: Colors.deepOrange,
      size: 400,
      angle: 45,
    );

    return Scaffold(
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
