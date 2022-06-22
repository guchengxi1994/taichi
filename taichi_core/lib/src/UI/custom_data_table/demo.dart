import 'package:flutter/material.dart';

class TabelDataModel {
  String name;
  int studentId;
  int language;
  int math;
  int english;
  int physical;
  int chemistry;
  int biological;
  int geography;
  int political;
  int history;
  bool isSelected;

  TabelDataModel(
    this.name,
    this.studentId,
    this.language,
    this.math,
    this.english,
    this.physical,
    this.chemistry,
    this.biological,
    this.geography,
    this.political,
    this.history, {
    this.isSelected = false,
  });
}

class ColumnName {
  const ColumnName({this.name = ""});

  final String name;
}

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
  final ScrollController controller3 = ScrollController();
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
    await Future.delayed(const Duration(microseconds: 2)).then((value) {
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

  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;

    controller3.jumpTo(metrics.pixels);

    return true;
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
            return Row(
              children: [
                ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller3,
                      child: SizedBox(
                        width: 120,
                        child: DataTable(
                          dataRowHeight: 40,
                          headingRowHeight: 55,
                          horizontalMargin: 20,
                          columnSpacing: 50,
                          dividerThickness: 2,
                          columns: const [
                            DataColumn(
                                label: Text(
                              "demo",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                          ],
                          rows: gradesList.map((e) {
                            return DataRow(
                                cells: [DataCell(Text("${e.name}成绩"))]);
                          }).toList(),
                        ),
                      ),
                    )),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Expanded(
                    child: Scrollbar(
                        controller: controller2,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                            controller: controller2,
                            scrollDirection: Axis.horizontal,
                            child: NotificationListener<ScrollNotification>(
                              onNotification: _handleScrollNotification,
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
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ));
                                  }).toList(),
                                  rows: gradesList.map((e) {
                                    return _getRow(e);
                                  }).toList(),
                                ),
                              ),
                            ))))
              ],
            );
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
