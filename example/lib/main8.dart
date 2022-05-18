import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:taichi/src/blocks/t_building_blocks_board.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaichiBlocksBoard(),
    );
  }
}
