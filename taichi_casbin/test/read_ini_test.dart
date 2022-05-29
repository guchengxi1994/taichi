/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 17:34:35
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 18:31:22
 */
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:ini/ini.dart';

File file = File("test/config.ini");

void doConfigThings(Config config, String label) {
  print("$label: loaded config from ${file.path}");
  print('');

  print("$label: Read some values...");
  print("$label: ${config.hasOption('default', 'default')}");
  print("$label: ${config.defaults()["default"]}");
  print("$label: ${config.get("section", "section")}");
  print('');

  print("$label: Write some values...");
  config.addSection("new");
  config.set("new", "entry", "result");
  print("$label: Added a new section and entry");
  print('');

  print("$label: Write out config (to screen)");
  print("$label: ${config.toString()}");
}

void main() {
  file
      .readAsLines()
      .then((lines) => Config.fromStrings(lines))
      .then((Config config) {
    doConfigThings(config, "async");
  });

  final Config config = Config.fromStrings(file.readAsLinesSync());
  doConfigThings(config, "sync");
}
