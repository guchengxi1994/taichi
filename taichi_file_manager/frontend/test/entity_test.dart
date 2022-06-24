import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:taichi_file_manager/models/my_tree_node.dart';

void main() {
  var s = """
{
    "name": "root",
    "children": [
        {
            "name": "aaa.md",
            "savePath": "aaa.md",
            "tags": [
                "deep learning",
                "useful tool"
            ],
            "fatherPath": "root",
            "timestamp": "2022-02-07 9:09:10",
            "depth": 0
        },
        {
            "name": "folder_aaa",
            "children": [
                {
                    "name": "bbb.md",
                    "savePath": "bbb.md",
                    "tags": [
                        "deep learning",
                        "useful tool"
                    ],
                    "fatherPath": "folder_aaa",
                    "timestamp": "2022-02-07 9:09:11",
                    "depth": 1
                },
                {
                    "name": "folder_bbb",
                    "children": [
                        {
                            "name": "folder_ccc",
                            "children": [
                                
                            ],
                            "fatherPath": "folder_bbb",
                            "depth": 2
                        }
                    ],
                    "fatherPath": "folder_aaa",
                    "depth": 1
                }
            ],
            "fatherPath": "root",
            "depth": 0
        }
    ],
    "depth": 0,
    "fatherPath": ""
}

""";

  test("run 1", () {
    EntityFolder? res = fromJsonToEntityAdd(
        s,
        "../root/folder_aaa/folder_bbb/folder_ccc",
        2,
        EntityFile(
          depth: 2,
          savePath: "./aaa.md",
          fatherPath: 'folder_bbb',
          timestamp: 'aaaa',
          name: '测试的名称-1.md',
        ),
        jsonEncode(jsonDecode(s)));

    // ignore: avoid_print
    print(json.encode(res?.toJson()));

    // expect(res, res != null);
  });
}
