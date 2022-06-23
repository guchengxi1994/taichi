/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-22 20:54:22
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-22 21:09:00
 */
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

void main() => runApp(
      const MyApp(),
    );

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TabelDataModel> gradesList = [
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// fixHead
              CustomDataTable(
                datas: gradesList,
                fixHead: true,
                seprateIndexes: const [2],
              ),
              const SizedBox(
                height: 50,
              ),

              /// fixTail
              CustomDataTable(
                datas: gradesList,
                fixTail: true,
                seprateIndexes: [gradesList.length - 2],
              ),
              const SizedBox(
                height: 50,
              ),

              /// fixBoth
              CustomDataTable(
                datas: gradesList,
                fixTail: true,
                fixHead: true,
                seprateIndexes: [1, gradesList.length - 2],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabelDataModel extends BaseData {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      "姓名": name,
      "id": studentId,
      "语文": language,
      "数学": math,
      "外语": english,
      "物理": physical,
      "化学": chemistry,
      "生物": biological,
      "地理": political,
      "历史": history
    };
  }
}
