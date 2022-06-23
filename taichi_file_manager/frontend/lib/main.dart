import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/screens/main_screen.dart';

import 'controllers/menu_controller.dart';
import 'controllers/file_tree_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuController()),
        ChangeNotifierProvider(create: (_) => FileTreeController()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
