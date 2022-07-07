// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taichi_accessible_widget/lib.dart';
import 'package:taichi_admin/app_style.dart';
import 'package:taichi_admin/routers.dart';
import 'package:taichi_admin/utils/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double left = 0;

  @override
  void initState() {
    super.initState();
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
        child: Stack(children: [buildTitle(), buildBottomNavigator()]),
      ),
    );
  }

  Widget buildTitle() {
    return Positioned(
      top: 48.0,
      right: 0.0,
      left: 0.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: 'This application is built with ',
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'Taichi',
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.red,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigator() {
    if (ScreenTypeUtils.isDesktop(context)) {
      return Positioned(
          bottom: 32.0,
          left: 0.0,
          right: 0.0,
          child: GestureDetector(
            onTap: () async {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) {
              //   return futureWidget();
              // }), (route) => false);
              await showRoleChooseDialog();
              Navigator.of(context).pushNamed(Routers.mainScreen);
            },
            child: Center(
              child: Opacity(
                opacity: 0.8,
                child: Shimmer.fromColors(
                  baseColor: AppStyle.shimmerColor,
                  highlightColor: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                      Text(
                        'Click to unlock',
                        style: TextStyle(
                          fontSize: 28.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
    }

    return Positioned(
        bottom: 32.0,
        left: 0.0,
        right: 0.0,
        child: GestureDetector(
          onHorizontalDragUpdate: (details) async {
            left += details.delta.dx;
            // debugPrint("[left]$left");
            if (left > 150) {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) {
              //   return futureWidget();
              // }), (route) => false);
              await showRoleChooseDialog();
              Navigator.of(context).pushNamed(Routers.mainScreen);
            }
          },
          child: Center(
            child: Opacity(
              opacity: 0.8,
              child: Shimmer.fromColors(
                baseColor: AppStyle.shimmerColor,
                highlightColor: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.chevron_right,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    Text(
                      'Slide to unlock',
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future showRoleChooseDialog() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: CupertinoAlertDialog(
              title: const Text("select your role"),
              content: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        context
                            .read<AccessController>()
                            .changeRole("test user");
                        Navigator.of(context).pop();
                      },
                      child: const Text("Common user")),
                  TextButton(
                      onPressed: () {
                        context.read<AccessController>().changeRole("admin");
                        Navigator.of(context).pop();
                      },
                      child: const Text("Admin"))
                ],
              ),
            ),
          );
        });
  }
}
