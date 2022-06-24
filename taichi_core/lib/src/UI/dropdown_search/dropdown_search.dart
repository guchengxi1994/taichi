import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/dropdown_search/dropdown_search_provider.dart';

import 'search_box.dart';
import 'text_field.dart';

typedef FutureFunc = Future<List<String>> Function();

// ignore: must_be_immutable
class DropDownSearch extends StatelessWidget {
  DropDownSearch(
      {Key? key,
      required this.datas,
      this.textFieldHeight = 50,
      this.searchBoxWidth = 300,
      this.searchBoxHeight = 300,
      this.textFieldWidth = 300})
      : super(key: key);
  final List<String> datas;
  final TextEditingController controller = TextEditingController();
  final LayerLink layerLink = LayerLink();
  bool show = false;
  final double textFieldWidth;
  final double textFieldHeight;
  final double searchBoxWidth;
  final double searchBoxHeight;

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DropdownSearchController()..init(datas),
      builder: (c, s) {
        return CompositedTransformTarget(
          link: layerLink,
          child: DropdownSearchTextField(
            width: textFieldWidth,
            height: textFieldHeight,
            hintText: "do_something",
            controller: controller,
            onIconTap: () {
              _toggleOverlay(c);
            },
          ),
        );
      },
    );
  }

  void _toggleOverlay(BuildContext context) {
    debugPrint("_toggleOverlay");
    if (!show) {
      // _showOverlay(context);
      _overlayEntry = OverlayEntry(builder: (c) {
        return UnconstrainedBox(
          child: CompositedTransformFollower(
            link: layerLink,

            ///主体的位置
            followerAnchor: Alignment.bottomCenter,

            ///这个是浮窗的位置
            targetAnchor: Alignment.topCenter,
            offset: Offset(0, searchBoxHeight + textFieldHeight),
            child: Material(
              // color: Colors.amber,
              child: SearchBox(
                width: searchBoxWidth,
                height: searchBoxHeight,
                ancestorContext: context,
                searchStr: context.watch<DropdownSearchController>().searchStr,
                onItemTap: (index) {
                  controller.text = context
                      .read<DropdownSearchController>()
                      .fliteredData[index];
                },
              ),
            ),
          ),
        );
      });
      OverlayState? overlayState = Navigator.of(context).overlay;
      debugPrint("overlayState $overlayState");
      overlayState?.insert(_overlayEntry!);
    } else {
      _hideOverlay();
    }
    show = !show;
  }

  void _hideOverlay() {
    try {
      _overlayEntry?.remove();
    } catch (_) {}
  }
}

class FutureDropdownSearch extends StatelessWidget {
  const FutureDropdownSearch({Key? key, required this.func}) : super(key: key);
  final FutureFunc func;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
