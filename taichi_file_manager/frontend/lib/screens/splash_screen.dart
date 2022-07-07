// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/controllers/role_controller.dart';
import 'package:taichi_file_manager/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  int t = 5;
  var loadMainLib;
  late OverlayEntry entry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      entry = OverlayEntry(builder: (_) {
        return Center(
            child: SizedBox(
          height: 200,
          width: 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: InkWell(
                  onTap: () {
                    context.read<RoleController>().changeRole(true);
                    entry.remove();
                    timer.cancel();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routers.mainScreen, (route) => false);
                  },
                  child: const Text(
                    "I am the developer",
                    maxLines: 2,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ));
      });
      Overlay.of(context)?.insert(entry);
      timer = Timer.periodic(const Duration(seconds: 1), (tim) {
        setState(() {
          t--;
        });

        if (t <= 0) {
          timer.cancel();
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routers.mainScreen, (route) => false);
          entry.remove();
        }
      });
    });
  }

  @override
  void dispose() {
    try {
      timer.cancel();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 90, 124, 224),
            Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
        )),
        child: Stack(children: [
          const Positioned(
              right: 20,
              bottom: 20,
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 100, 218, 147),
              )),
          Positioned(
              right: 20,
              top: 20,
              child: Text(
                t.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ))
        ]),
      ),
    );
  }
}
