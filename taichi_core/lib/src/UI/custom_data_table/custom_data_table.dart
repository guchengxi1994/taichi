/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-22 19:58:45
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-22 21:08:52
 */
import 'package:flutter/material.dart';
import 'package:taichi/src/UI/custom_data_table/base_data.dart';

class CustomDataTable<T extends BaseData> extends StatefulWidget {
  const CustomDataTable(
      {Key? key,
      this.dataRowHeight = 40,
      this.headingRowHeight = 55,
      this.horizontalMargin = 20,
      this.columnSpacing = 50,
      this.dividerThickness = 2,
      this.padding = 20,
      this.tableHeight = 500,
      this.tableWidth = 500,
      this.fixHead = false,
      this.fixTail = false,
      required this.datas,
      this.actions = const [],
      this.headWidth = 150,
      this.tailWidth = 150,
      this.seprateIndexes = const []})
      : assert((seprateIndexes.length == 0 ||
                seprateIndexes.length == 2 ||
                seprateIndexes.length == 1) &&
            datas.length > 0),
        super(key: key);
  final bool fixHead;
  final bool fixTail;
  final List<T> datas;
  final double headWidth;
  final double tailWidth;
  final List<Widget> actions;
  final List<int> seprateIndexes;
  final double tableWidth;
  final double tableHeight;
  final double padding;

  final double dataRowHeight;
  final double headingRowHeight;
  final double horizontalMargin;
  final double columnSpacing;
  final double dividerThickness;

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  late List<int> seprateIndexes;
  final ScrollController tableController = ScrollController();
  final ScrollController scrollbarController = ScrollController();
  final ScrollController controller3 = ScrollController();

  @override
  void initState() {
    super.initState();
    seprateIndexes = widget.seprateIndexes;
    if (seprateIndexes.length >= 2) {
      seprateIndexes.sort();
    }
  }

  @override
  void dispose() {
    tableController.dispose();
    scrollbarController.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fixHead && widget.fixTail) {
      assert(seprateIndexes.length == 2, """
      如果 `fixHead==true` 并且 `fixTail==true`,那么需要两个下标控制
      表格样式
      ======
      if `fixHead==true` and `fixTail==true`,then seprateIndexes.length 
      must be 2
      """);
    }

    if (widget.fixHead || widget.fixTail) {
      assert(seprateIndexes.length == 1, """
      如果 `fixHead==true` 或者 `fixTail==true`,那么需要1个下标控制
      表格样式
      ======
      if `fixHead==true` or `fixTail==true`,then seprateIndexes.length 
      must be 1
      """);
    }

    if (seprateIndexes.isNotEmpty) {
      assert(
          seprateIndexes.last < widget.datas.first.toMap().length &&
              seprateIndexes.last > 0,
          """
              下标需大于0小于表格列数
              ======
              index must >0 and < column length(column length = datas.first.toMap().length)
          """);
    }

    List<String> columnNames = widget.datas.first.toMap().keys.toList();

    if (widget.fixHead == false && widget.fixTail == false) {
      return Container(
        padding: EdgeInsets.all(widget.padding),
        width: widget.tableWidth,
        height: widget.tableHeight,
        child: Scrollbar(
          controller: scrollbarController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: scrollbarController,
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              controller: tableController,
              child: DataTable(
                  dataRowHeight: widget.dataRowHeight,
                  headingRowHeight: widget.headingRowHeight,
                  horizontalMargin: widget.horizontalMargin,
                  columnSpacing: widget.columnSpacing,
                  dividerThickness: widget.dividerThickness,
                  columns: columnNames.map((e) {
                    return DataColumn(
                        tooltip: e,
                        numeric: false,
                        label: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ));
                  }).toList(),
                  rows:
                      widget.datas.map((e) => _getRowWithoutFixed(e)).toList()),
            ),
          ),
        ),
      );
    }

    return Container();
  }

  DataRow _getRowWithoutFixed<T extends BaseData>(T data) {
    List<DataCell> cells = [];
    for (final i in data.toMap().values) {
      cells.add(DataCell(Text(i.toString())));
    }

    return DataRow(cells: cells);
  }
}
