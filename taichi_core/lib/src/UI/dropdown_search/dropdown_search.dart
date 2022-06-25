import 'package:flutter/material.dart';

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
      this.textFieldWidth = 300,
      this.hintText = "do_something",
      this.onBoxItemTap,
      this.onTextChange})
      : super(key: key);
  final List<String> datas;
  final TextEditingController controller = TextEditingController();
  final LayerLink layerLink = LayerLink();
  bool show = false;
  final double textFieldWidth;
  final double textFieldHeight;
  final double searchBoxWidth;
  final double searchBoxHeight;
  final String hintText;
  final StringCallback? onTextChange;
  final StringCallback? onBoxItemTap;

  OverlayEntry? _overlayEntry;
  late List<String> d = datas;
  final GlobalKey<SearchBoxState> boxkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: layerLink,
        child: DropdownSearchTextField(
          width: textFieldWidth,
          height: textFieldHeight,
          hintText: hintText,
          controller: controller,
          onTextChange: (s) {
            d = datas
                .where(
                  (element) => element.contains(s),
                )
                .toList();
            if (boxkey.currentState != null) {
              if (s == "") {
                d = datas;
              }
              boxkey.currentState?.changeDatas(d);
            }
            if (onTextChange != null) {
              onTextChange!(s);
            }
          },
          onIconTap: () {
            _toggleOverlay(context);
          },
        ));
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
                key: boxkey,
                datas: datas,
                width: searchBoxWidth,
                height: searchBoxHeight,
                onItemTap: (index) {
                  controller.text = d[index];
                  if (onBoxItemTap != null) {
                    onBoxItemTap!(controller.text);
                  }
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
