import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:taichi/src/UI/watermark/_t_watermark_mixin.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TaichiWatermarkMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("this is a test widget"),
      ),
      appBar: AppBar(),
    );
  }
}
