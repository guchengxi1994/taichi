// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';
import 'package:taichi_admin/widgets/future_builder.dart';
import 'darshboard_custom_card.dart' deferred as card;

class DashboardLeftPart extends StatefulWidget {
  const DashboardLeftPart({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<DashboardLeftPart> createState() => _DashboardLeftPartState();
}

class _DashboardLeftPartState extends State<DashboardLeftPart> {
  var loadCardFuture;
  var loadWidgetsFuture;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    loadCardFuture = card.loadLibrary();
    loadWidgetsFuture = loadWidgets();
  }

  Future loadWidgets() async {
    widgets = List.generate(4, (index) {
      return FutureLoaderWidget(
          builder: (context) => card.CustomCard(
                type: widget.type,
                data: index,
              ),
          loadWidgetFuture: loadCardFuture);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureBuilder(
            future: loadWidgetsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasError) {
                  return Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: widgets,
                  );
                } else {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
      ],
    );
  }
}
