import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:taichi/src/encrypt/sm/sm4.dart';
import 'dart:io' show Directory;

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
              onPressed: () {
                SM4 _sm4 = SM4(key: "qwertyasdfgh1234")..init();
                String s = _sm4.encode(_controller.text);
                debugPrint(s);
              },
              child: const Text("加密")),
          ElevatedButton(
              onPressed: () {
                SM4 _sm4 = SM4(key: "qwertyasdfgh1234")..init();
                String s = _sm4.decode(_controller.text);
                debugPrint(s);
              },
              child: const Text("解密")),
          ElevatedButton(
              onPressed: () {
                debugPrint(Directory.current.path);
              },
              child: const Text("current path"))
        ],
      ),
    );
  }
}
