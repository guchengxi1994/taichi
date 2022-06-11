/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 17:31:41
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-11 17:47:28
 */

import 'package:flutter/material.dart';

class WidgetLoaderWidget extends StatelessWidget {
  const WidgetLoaderWidget(
      {Key? key, required this.builder, required this.loadWidgetFuture})
      : super(key: key);

  final Future loadWidgetFuture;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadWidgetFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              debugPrint("[debug error]:${snapshot.error}");
              return const Center(
                child: Text("error"),
              );
            }
            return builder.call(context);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
