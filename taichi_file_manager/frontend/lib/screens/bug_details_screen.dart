// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:taichi_file_manager/widgets/future_builder.dart';
import 'package:taichi_file_manager/widgets/table_widget.dart'
    deferred as table;

import '../app_style.dart';

class BugDetailsScreen extends StatefulWidget {
  const BugDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BugDetailsScreen> createState() => _BugDetailsScreenState();
}

class _BugDetailsScreenState extends State<BugDetailsScreen> {
  var loadTableLib;

  @override
  void initState() {
    super.initState();
    loadTableLib = table.loadLibrary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.lightBlue,
        elevation: 0,
      ),
      body: FutureLoaderWidget(
        builder: (context) => table.TableWidget(
          tableHeight: 600,
          tableWidth: MediaQuery.of(context).size.width,
        ),
        loadWidgetFuture: loadTableLib,
      ),
    );
  }
}
