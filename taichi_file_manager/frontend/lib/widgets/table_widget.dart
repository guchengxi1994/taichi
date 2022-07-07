import 'package:flutter/material.dart';
import 'package:taichi_file_manager/models/bug_resp.dart';
import 'package:taichi_file_manager/utils/dio_utils.dart';
import 'package:taichi_file_manager/api.dart';
import 'package:dio/dio.dart';

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
  DioUtils dioUtils = DioUtils();

  List<ColumnName> columnNames = [];
  late List<Bugs> bugs = [];

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
    columnNames = [
      const ColumnName(name: "Bug id"),
      const ColumnName(name: "Bug summary"),
      const ColumnName(name: "Bug content"),
      const ColumnName(name: "Bug fixed"),
      const ColumnName(name: "Bug report time"),
      const ColumnName(name: "Operations"),
    ];
    Response? r = await dioUtils.get(Server + Apis["allBugs"]!);
    if (r != null) {
      debugPrint("[r]:$r");
      BugResp resp = BugResp.fromJson(r.data);
      if (resp.bugs != null && resp.bugs!.isNotEmpty) {
        bugs = resp.bugs ?? [];
      }
    }
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
                      rows: bugs.map((e) {
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

  DataRow _getRow(Bugs model) {
    return DataRow(cells: [
      DataCell(Text(model.bugId.toString())),
      DataCell(Text(model.bugSummary.toString())),
      DataCell(Text("${model.bugContent.toString().substring(0, 20)}...")),
      DataCell(Text((model.bugFixed! == 1).toString())),
      DataCell(Text(model.bugReportedTime ?? "")),
      DataCell(Row(
        children: [
          TextButton(onPressed: () {}, child: const Text("Marked as done"))
        ],
      )),
    ]);
  }
}

class ColumnName {
  const ColumnName({this.name = ""});

  final String name;
}
