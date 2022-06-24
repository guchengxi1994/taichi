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
      this.seprateIndexes = const [],
      this.tableScrollIndicatorAlwaysAtTheEnd = false})
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

  final bool tableScrollIndicatorAlwaysAtTheEnd;

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  late List<int> seprateIndexes;
  final ScrollController tableController = ScrollController();
  final ScrollController scrollbarController = ScrollController();
  final ScrollController headController = ScrollController();
  final ScrollController tailController = ScrollController();

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
    headController.dispose();
    tailController.dispose();
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

    if ((widget.fixHead && widget.fixTail) == false &&
        (widget.fixHead || widget.fixTail)) {
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
      return _wrapper(
          child: Scrollbar(
        controller: scrollbarController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollbarController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            controller: tableController,
            child: _buildTable(columnNames,
                widget.datas.map((e) => _getRowWithoutFixed(e)).toList()),
          ),
        ),
      ));
    }

    if (widget.fixHead && !widget.fixTail) {
      List<List<DataRow>> seprateRows = widget.datas
          .map((e) => _getRowIfFixed(e, widget.seprateIndexes[0]))
          .toList();

      List<DataRow> first = [];
      List<DataRow> second = [];
      for (final i in seprateRows) {
        first.add(i[0]);
        second.add(i[1]);
      }

      return _wrapper(
          child: Row(
        children: [
          ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: headController,
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  child: _buildTable(
                      columnNames.sublist(0, widget.seprateIndexes[0]), first),
                ),
              )),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          Expanded(
              child: Scrollbar(
                  controller: scrollbarController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                      controller: scrollbarController,
                      scrollDirection: Axis.horizontal,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          return _handleScrollNotification(
                              notification, [headController]);
                        },
                        child: SingleChildScrollView(
                          controller: tableController,
                          child: _buildTable(
                              columnNames.sublist(widget.seprateIndexes[0]),
                              second),
                        ),
                      ))))
        ],
      ));
    }

    if (widget.fixTail && !widget.fixHead) {
      List<List<DataRow>> seprateRows = widget.datas
          .map((e) => _getRowIfFixed(e, widget.seprateIndexes[0]))
          .toList();

      List<DataRow> first = [];
      List<DataRow> second = [];
      for (final i in seprateRows) {
        first.add(i[0]);
        second.add(i[1]);
      }

      return _wrapper(
          child: Row(
        children: [
          Expanded(
              child: Scrollbar(
                  controller: scrollbarController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                      controller: scrollbarController,
                      scrollDirection: Axis.horizontal,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          return _handleScrollNotification(
                              notification, [tailController]);
                        },
                        child: SingleChildScrollView(
                          controller: tableController,
                          child: _buildTable(
                              columnNames.sublist(0, widget.seprateIndexes[0]),
                              first),
                        ),
                      )))),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: tailController,
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  child: _buildTable(
                      columnNames.sublist(widget.seprateIndexes[0]), second),
                ),
              )),
        ],
      ));
    }

    if (widget.fixHead && widget.fixTail) {
      List<List<DataRow>> seprateRows = widget.datas
          .map((e) => _getRowBothFixed(
              e, widget.seprateIndexes[0], widget.seprateIndexes[1]))
          .toList();
      List<DataRow> first = [];
      List<DataRow> second = [];
      List<DataRow> third = [];

      for (final i in seprateRows) {
        first.add(i[0]);
        second.add(i[1]);
        third.add(i[2]);
      }

      return _wrapper(
          child: Row(
        children: [
          ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: headController,
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  child: _buildTable(
                      columnNames.sublist(0, widget.seprateIndexes[0]), first),
                ),
              )),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          Expanded(
              child: Scrollbar(
                  controller: scrollbarController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                      controller: scrollbarController,
                      scrollDirection: Axis.horizontal,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          return _handleScrollNotification(
                              notification, [headController, tailController]);
                        },
                        child: SingleChildScrollView(
                          controller: tableController,
                          child: _buildTable(
                              columnNames.sublist(widget.seprateIndexes[0],
                                  widget.seprateIndexes[1]),
                              second),
                        ),
                      )))),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: tailController,
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  child: _buildTable(
                      columnNames.sublist(widget.seprateIndexes[1]), third),
                ),
              )),
        ],
      ));
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

  List<DataRow> _getRowIfFixed<T extends BaseData>(T data, int index) {
    List<DataCell> cells1 = [];
    List<DataCell> cells2 = [];
    final values = data.toMap().values.toList();

    for (int i = 0; i < index; i++) {
      cells1.add(DataCell(Text(values[i].toString())));
    }

    for (int i = index; i < values.length; i++) {
      cells2.add(DataCell(Text(values[i].toString())));
    }

    return [DataRow(cells: cells1), DataRow(cells: cells2)];
  }

  List<DataRow> _getRowBothFixed<T extends BaseData>(
      T data, int index1, int index2) {
    List<DataCell> cells1 = [];
    List<DataCell> cells2 = [];
    List<DataCell> cells3 = [];
    final values = data.toMap().values.toList();

    for (int i = 0; i < index1; i++) {
      cells1.add(DataCell(Text(values[i].toString())));
    }

    for (int i = index1; i < index2; i++) {
      cells2.add(DataCell(Text(values[i].toString())));
    }

    for (int i = index2; i < values.length; i++) {
      cells3.add(DataCell(Text(values[i].toString())));
    }

    return [
      DataRow(cells: cells1),
      DataRow(cells: cells2),
      DataRow(cells: cells3)
    ];
  }

  Widget _wrapper({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(widget.padding),
      width: widget.tableWidth,
      height: widget.tableHeight,
      child: child,
    );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, List<ScrollController> controllers) {
    final ScrollMetrics metrics = notification.metrics;
    for (final i in controllers) {
      i.jumpTo(metrics.pixels);
    }

    return true;
  }

  Widget _buildTable(List<String> columns, List<DataRow> rows) {
    return DataTable(
        dataRowHeight: 40,
        headingRowHeight: 55,
        horizontalMargin: 20,
        columnSpacing: 50,
        dividerThickness: 2,
        columns: columns.map((e) {
          return DataColumn(
              tooltip: e,
              numeric: false,
              label: Text(
                e,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ));
        }).toList(),
        rows: rows);
  }
}
