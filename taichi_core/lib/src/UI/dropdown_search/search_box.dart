// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdown_search_provider.dart';

typedef ItemTapCallBack = String Function(int index);

class SearchBox extends StatelessWidget {
  SearchBox(
      {Key? key,
      this.width = 300,
      this.height = 300,
      this.onItemTap,
      this.searchStr = "",
      this.ancestorContext})
      : super(key: key);
  final double width;
  final double height;
  final ScrollController scrollController = ScrollController();
  final ItemTapCallBack? onItemTap;
  final String searchStr;
  final BuildContext? ancestorContext;

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "[ancestorContext] : ${ancestorContext?.watch<DropdownSearchController>() == null}");

    List<String> _datas = (ancestorContext ?? context)
        .watch<DropdownSearchController>()
        .fliteredData;

    debugPrint("[_datas]:$_datas");

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 205, 183, 183), width: 0.5),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(10))),
      height: height,
      width: width,
      child: ListView.builder(
          itemCount: _datas.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (onItemTap != null) {
                  onItemTap!(index);
                }
              },
              child: Text(_datas[index]),
            );
          }),
    );
  }
}
