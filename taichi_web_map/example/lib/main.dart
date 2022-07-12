// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taichi_web_map/amap_web_controller.dart';
import 'package:taichi_web_map/map_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loadKey;
  late String data;
  late final AmapWebController controller;
  @override
  void initState() {
    super.initState();
    loadKey = loadKeyFuture();
  }

  loadKeyFuture() async {
    data = await rootBundle.loadString("assets/key.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("map"),
          SizedBox(
            height: 300,
            width: 500,
            child: FutureBuilder(
              future: loadKey,
              builder: (c, s) {
                if (s.connectionState == ConnectionState.done) {
                  debugPrint("data:$data");
                  return TaichiMapView(
                    apiKey: data,
                    onCreate: (c) {
                      controller = c;
                    },
                    onPoiSearched: (r) {
                      debugPrint("r:${r.toString()}");
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}
