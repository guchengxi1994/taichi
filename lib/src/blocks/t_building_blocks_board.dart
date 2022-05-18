import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_drag_controller.dart';
import '_draggable_widget.dart';
import 'constants.dart';

class _TaichiBlocksBoard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _TaichiBlocksBoard({Key? key}) : super(key: key);

  @override
  State<_TaichiBlocksBoard> createState() => _TaichiBlocksBoardState();
}

class _TaichiBlocksBoardState extends State<_TaichiBlocksBoard> {
  late Color sideColor = Colors.grey[200]!;

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;

    context.read<DragController>().changeWidth(widgetWidth);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: AppBar(
          elevation: 0,
          title: const Text("Taichi board"),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
          key: UniqueKey(),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: sideColor,
                    height: widgetHeight,
                    child: Wrap(
                      children: [Blocks()],
                    ),
                  )),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: widgetHeight,
                    child: Stack(
                      children: context.watch<DragController>().widgets,
                    ),
                  )),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: sideColor,
                    height: widgetHeight,
                  )),
            ],
          )),
    );
  }
}

class TaichiBlocksBoard extends StatelessWidget {
  const TaichiBlocksBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DragController(),
      builder: (context, _) {
        return _TaichiBlocksBoard();
      },
    );
  }
}
