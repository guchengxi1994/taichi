/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-20 20:41:06
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-20 22:02:42
 */

import 'package:flutter/material.dart';

import '../models/table_data.dart';

class TableWidget extends StatefulWidget {
  const TableWidget(
      {Key? key, required this.tableHeight, required this.tableWidth})
      : super(key: key);
  final double tableWidth;
  final double tableHeight;

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  // ignore: prefer_typing_uninitialized_variables
  var testFuture;

  List<TabelDataModel> gradesList = [];
  List<ColumnName> columnNames = [];

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    testFuture = loadData();
  }

  Future loadData() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      debugPrint("data loaded");
      columnNames = const [
        ColumnName(name: '姓名'),
        ColumnName(name: '学号'),
        ColumnName(name: '语文'),
        ColumnName(name: '数学'),
        ColumnName(name: '英语'),
        ColumnName(name: '物理'),
        ColumnName(name: '化学'),
        ColumnName(name: '生物'),
        ColumnName(name: '地理'),
        ColumnName(name: '政治'),
        ColumnName(name: '历史'),
      ];
      gradesList = [
        TabelDataModel('嬴政', 1, 89, 88, 100, 76, 81, 77, 95, 85, 80),
        TabelDataModel('刘邦', 2, 95, 100, 90, 72, 65, 88, 66, 79, 96),
        TabelDataModel('刘秀', 3, 100, 67, 87, 96, 89, 69, 79, 78, 73),
        TabelDataModel('曹丕', 4, 85, 75, 86, 91, 100, 66, 100, 90, 83),
        TabelDataModel('司马炎', 5, 89, 88, 100, 76, 81, 77, 95, 85, 80),
        TabelDataModel('杨坚', 6, 95, 100, 90, 72, 65, 88, 66, 79, 96),
        TabelDataModel('李渊', 7, 100, 67, 87, 96, 89, 69, 79, 78, 73),
        TabelDataModel('赵匡胤', 8, 85, 75, 86, 91, 100, 66, 100, 90, 83),
        TabelDataModel('忽必烈', 9, 89, 88, 100, 76, 81, 77, 95, 85, 80),
        TabelDataModel('朱元璋', 10, 95, 100, 90, 72, 65, 88, 66, 79, 96),
        TabelDataModel('皇太极', 11, 100, 67, 87, 96, 89, 69, 79, 78, 73),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: widget.tableWidth,
      height: widget.tableHeight,
      child: FutureBuilder(
        future: testFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scrollbar(
                controller: controller2,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: controller2,
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: DataTable(
                      dataRowHeight: 40,
                      headingRowHeight: 55,
                      horizontalMargin: 20,
                      columnSpacing: 50,
                      dividerThickness: 2,
                      columns: columnNames.map((e) {
                        return DataColumn(
                            tooltip: e.name,
                            numeric: false,
                            label: Text(
                              e.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ));
                      }).toList(),
                      rows: gradesList.map((e) {
                        return _getRow(e);
                      }).toList(),
                    ),
                  ),
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  DataRow _getRow(TabelDataModel model) {
    return DataRow(cells: [
      DataCell(Text(model.name)),
      DataCell(Text(model.studentId.toString())),
      DataCell(Text(model.language.toString())),
      DataCell(Text(model.math.toString())),
      DataCell(Text(model.english.toString())),
      DataCell(Text(model.physical.toString())),
      DataCell(Text(model.chemistry.toString())),
      DataCell(Text(model.biological.toString())),
      DataCell(Text(model.geography.toString())),
      DataCell(Text(model.political.toString())),
      DataCell(Text(model.history.toString())),
    ]);
  }
}
