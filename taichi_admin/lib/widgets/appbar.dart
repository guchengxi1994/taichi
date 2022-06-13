// ignore_for_file: prefer_typing_uninitialized_variables

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-11 18:36:56
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-13 22:01:29
 */
import 'package:flutter/material.dart';
import 'package:taichi_admin/utils/common.dart';
import 'package:taichi_admin/widgets/search_bar.dart' deferred as searchbar;
import 'package:taichi_admin/widgets/dropdown_button.dart' deferred as dropdown;
import 'package:taichi_admin/widgets/future_builder.dart';

class MainScreenAppbar extends StatefulWidget {
  const MainScreenAppbar({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<MainScreenAppbar> createState() => _MainScreenAppbarState();
}

class _MainScreenAppbarState extends State<MainScreenAppbar> {
  var loadDropdownListFuture;
  var loadSearchbarFuture;

  @override
  void initState() {
    super.initState();
    loadDropdownListFuture = dropdown.loadLibrary();
    loadSearchbarFuture = searchbar.loadLibrary();
  }

  List<Widget> buildAppbarTitle() {
    if (widget.type == ScreenType.desktop) {
      return [
        const Text("Taichi Admin"),
        Expanded(child: Container()),
        FutureLoaderWidget(
          loadWidgetFuture: loadSearchbarFuture,
          builder: (context) {
            return searchbar.SearchBar(
              type: widget.type,
            );
          },
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          child: FutureLoaderWidget(
            loadWidgetFuture: loadDropdownListFuture,
            builder: (context) {
              return dropdown.UserDropdownButton(
                type: widget.type,
              );
            },
          ),
        ),
      ];
    } else {
      return [
        // Expanded(child: Container()),
        FutureLoaderWidget(
          loadWidgetFuture: loadSearchbarFuture,
          builder: (context) {
            return searchbar.SearchBar(
              type: widget.type,
            );
          },
        ),
        Expanded(child: Container()),
        Container(
          height: 50,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: FutureLoaderWidget(
            loadWidgetFuture: loadDropdownListFuture,
            builder: (context) {
              return dropdown.UserDropdownButton(
                type: widget.type,
              );
            },
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.type != ScreenType.desktop,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: buildAppbarTitle(),
      ),
      centerTitle: false,
      elevation: widget.type == ScreenType.mobile ? 4 : 0,
      // actions: buildAppbarActions(),
    );
  }
}
