// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Side { left, right }

class ChangeRegionController extends ChangeNotifier {
  List<_wrapper> _leftWidgets = [];
  List<_wrapper> _rightWidgets = [];

  List<_wrapper> get leftWidgets => _leftWidgets;

  /// short cut
  List<_wrapper> get left => _leftWidgets;

  List<_wrapper> get rightWidgets => _rightWidgets;

  /// short cut
  List<_wrapper> get right => _rightWidgets;

  changeSide(int index) {
    Side side = Side.left;

    var _widget = _leftWidgets.firstWhere((element) => element.index == index,
        orElse: () => _wrapper(index: -1, child: Container()));
    if (_widget.index == -1) {
      side = Side.right;
      _widget = _rightWidgets.firstWhere((element) => element.index == index,
          orElse: () => _wrapper(index: -1, child: Container()));
    }
    if (_widget.index != -1) {
      if (side == Side.left) {
        _leftWidgets.remove(_widget);
        _rightWidgets.add(_widget);
      } else {
        _leftWidgets.add(_widget);
        _rightWidgets.remove(_widget);
      }

      notifyListeners();
    }
  }

  void init(List<Widget> left, List<Widget> right) {
    var count = 0;
    _leftWidgets.clear();
    _rightWidgets.clear();
    for (var i in left) {
      _leftWidgets.add(_wrapper(index: count, child: i));
      count += 1;
    }
    for (var i in right) {
      _rightWidgets.add(_wrapper(index: count, child: i));
      count += 1;
    }
    notifyListeners();
  }
}

// ignore: camel_case_types
class _wrapper extends StatelessWidget {
  const _wrapper({Key? key, required this.index, required this.child})
      : super(key: key);
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /// use double tap to change side
      onDoubleTap: () {
        context.read<ChangeRegionController>().changeSide(index);
      },
      child: child,
    );
  }
}

class GroupChooseWidget extends StatelessWidget {
  const GroupChooseWidget({Key? key, required this.width, required this.height})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: height,
            margin: const EdgeInsets.only(right: 3),
            decoration:
                const BoxDecoration(color: Colors.greenAccent, boxShadow: [
              BoxShadow(
                color: Color(0xFFE8E8E8),
                offset: Offset(8, 8),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ]),
            child: SingleChildScrollView(
              key: UniqueKey(),
              child: Column(
                children: context.watch<ChangeRegionController>().left,
              ),
            ),
          )),
          Expanded(
              child: Container(
            height: height,
            margin: const EdgeInsets.only(left: 3),
            decoration:
                const BoxDecoration(color: Colors.blueAccent, boxShadow: [
              BoxShadow(
                color: Color(0xFFE8E8E8),
                offset: Offset(8, 8),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ]),
            child: SingleChildScrollView(
              key: UniqueKey(),
              child: Column(
                children: context.watch<ChangeRegionController>().right,
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class TaichiGroupChoose {
  static Widget simple(List<Widget> left, List<Widget> right,
      {double height = 300, double width = 300}) {
    return ChangeNotifierProvider(
      create: (_) => ChangeRegionController()..init(left, right),
      builder: (context, _) {
        return const GroupChooseWidget(
          height: 300,
          width: 300,
        );
      },
    );
  }
}
