/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-15 20:22:06
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-15 20:23:52
 */
import 'package:flutter/material.dart';
import 'package:taichi_admin/screens/second_screen.dart';

/// this is for test
class TempleteScreen extends StatelessWidget {
  const TempleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Navigator(
        initialRoute: "/",
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("this is a templete page"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SecondScreen();
                          }));
                        },
                        child: const Text("跳转"))
                  ],
                );
              };
              break;
            default:
              builder = (context) => const Text("this is a error page");
          }
          return MaterialPageRoute(builder: builder);
        },
      ),
    );
  }
}
