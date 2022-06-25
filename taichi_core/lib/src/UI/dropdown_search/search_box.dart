// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

typedef ItemTapCallBack = Function(int index);

class SearchBox extends StatefulWidget {
  const SearchBox(
      {Key? key,
      this.width = 300,
      this.height = 300,
      this.onItemTap,
      required this.datas})
      : super(key: key);
  final double width;
  final double height;

  final ItemTapCallBack? onItemTap;
  final List<String> datas;

  @override
  State<SearchBox> createState() => SearchBoxState();
}

class SearchBoxState extends State<SearchBox> {
  late List<String> _datas = [];

  @override
  void initState() {
    super.initState();
    _datas = widget.datas;
  }

  changeDatas(List<String> l) {
    _datas = l;
    setState(() {});
  }

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 205, 183, 183), width: 0.5),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(10))),
      height: widget.height,
      width: widget.width,
      child: ListView.builder(
          itemCount: _datas.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (widget.onItemTap != null) {
                  widget.onItemTap!(index);
                }
              },
              child: Text(_datas[index]),
            );
          }),
    );
  }
}
