import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taichi_file_manager/models/my_tree_node.dart' show EntityFolder;

class FileTreeController extends ChangeNotifier {
  String _currentTreeNodeName = "";
  String get currentTreeNodeName => _currentTreeNodeName;

  changeTreeNodeName(String s) {
    _currentTreeNodeName = s;
    notifyListeners();
  }

  late EntityFolder _entity;

  init() async {
    String fileStructureStr = """
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

    _entity = EntityFolder.fromJson(jsonDecode(fileStructureStr));
    _currentEntity = _entity;
    notifyListeners();
  }

  EntityFolder get structure => _entity;

  late EntityFolder _currentEntity;

  List<Object> get currentFolderContent => _currentEntity.children;
  int get depth => _currentEntity.depth;

  changeCurrentEntity(EntityFolder e) {
    _currentEntity = e;
    notifyListeners();
  }
}
