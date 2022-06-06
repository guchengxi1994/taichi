import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_board_designer/blocks/providers/_main_block_controller.dart';

import 'entity/_enums.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<BlockController>().boardType != BoardType.custom
        ? Stack(
            children: context.watch<BlockController>().widgets,
          )
        : Card(
            margin: const EdgeInsets.all(5),
            shadowColor: const Color.fromARGB(255, 204, 148, 148),
            elevation: 20,
            child: Stack(
              children: context.watch<BlockController>().widgets,
            ),
          );
  }
}
