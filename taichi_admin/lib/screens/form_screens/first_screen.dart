// ignore_for_file: prefer_typing_uninitialized_variables

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
import 'package:taichi_admin/screens/form_screens/second_screen.dart';
import 'package:taichi_admin/widgets/form_1.dart' deferred as form1;
import 'package:taichi_admin/widgets/future_builder.dart';

class TempleteScreen extends StatefulWidget {
  const TempleteScreen({Key? key}) : super(key: key);

  @override
  State<TempleteScreen> createState() => _TempleteScreenState();
}

class _TempleteScreenState extends State<TempleteScreen> {
  var loadFormLib;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadFormLib = form1.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (context) {
              return Center(
                  child: Card(
                      child: Container(
                          height: 300,
                          width: 400,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureLoaderWidget(
                                  builder: (context) => form1.BaseInfoWidget(
                                        formKey: _formKey,
                                      ),
                                  loadWidgetFuture: loadFormLib),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const SecondScreen();
                                      }));
                                    } else {
                                      /// 使用toast或者其它消息通知
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('校验失败...'),
                                      ));
                                    }
                                  },
                                  child: const Text("下一步"))
                            ],
                          ))));
            };
            break;
          default:
            builder = (context) => const Text("this is a error page");
        }
        return MaterialPageRoute(builder: builder);
      },
    );
  }
}
