import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart' show DropDownSearch;

void main() => runApp(
      const MyApp(),
    );

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> l = ["I", "love", "China"];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container()),
          DropDownSearch(
              onBoxItemTap: (s) {
                debugPrint("[clicked item]:$s");
              },
              onTextChange: (s) {
                debugPrint("[text change]:$s");
              },
              datas: l)
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
