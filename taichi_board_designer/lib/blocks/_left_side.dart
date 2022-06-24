import 'package:flutter/material.dart';

import '_draggable_widget.dart';
import 'entity/_constants.dart';

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: BlockConstants.supportedTypes
            .map((e) => Blocks(
                  widgetName: e,
                ))
            .toList(),
      ),
    );
  }
}
