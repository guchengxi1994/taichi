// ignore_for_file: avoid_init_to_null

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taichi_file_manager/api.dart';
import 'package:taichi_file_manager/models/file_response.dart';
import 'package:taichi_file_manager/models/my_tree_node.dart';
import 'package:taichi_file_manager/utils/dio_utils.dart';

class FileTreeController extends ChangeNotifier {
  String _currentTreeNodeName = "";
  String get currentTreeNodeName => _currentTreeNodeName;

  changeTreeNodeName(String s) {
    _currentTreeNodeName = s;
    notifyListeners();
  }

  late EntityFolder? _entity = null;

  init() async {
    DioUtils dioUtils = DioUtils();
    Response? response = await dioUtils.get(Server + Apis["getFile"]!);

    if (response != null) {
      // debugPrint(response.toString());
      FileResponse res = FileResponse.fromJson(response.data);
      List<EntityFile> files =
          res.savedFiles!.map((e) => EntityFile.fromSavedFile(e)).toList();
      List<String> paths = [];
      for (final i in files) {
        paths.add('${i.fatherPath}/${i.name}');
        paths.add(i.fatherPath);
      }
      // debugPrint("[files]:${files.length}");
      FlattenObject flattenObject = FlattenObject(files: files, path: paths);
      EntityFolder? f = toStructured(flattenObject);
      // debugPrint("[f]:${f?.toJson()}");
      _entity = f;
      // debugPrint("[flatten]:${flatten(_entity!).path}");
      _currentEntity = _entity;
    }

//     String fileStructureStr = """
//         {
//     "name": "root",
//     "children": [
//         {
//             "name": "aaa.md",
//             "savePath": "aaa.md",
//             "tags": [
//                 "deep learning",
//                 "useful tool"
//             ],
//             "fatherPath": "../root",
//             "timestamp": "2022-02-07 9:09:10",
//             "depth": 1
//         },
//         {
//             "name": "folder_aaa",
//             "children": [
//                 {
//                     "name": "bbb.md",
//                     "savePath": "bbb.md",
//                     "tags": [
//                         "deep learning",
//                         "useful tool"
//                     ],
//                     "fatherPath": "../root/folder_aaa",
//                     "timestamp": "2022-02-07 9:09:11",
//                     "depth": 2
//                 }
//             ],
//             "fatherPath": "../root",
//             "depth": 1
//         }
//     ],
//     "depth": 0,
//     "fatherPath": ""
// }
//       """;

//     _entity = EntityFolder.fromJson(jsonDecode(fileStructureStr));

//     debugPrint("[flatten]:${flatten(_entity!).path}");

//     _currentEntity = _entity;
    notifyListeners();
  }

  EntityFolder? get structure => _entity;

  late EntityFolder? _currentEntity = null;

  List<Object>? get currentFolderContent => _currentEntity?.children;
  int? get depth => _currentEntity?.depth;

  changeCurrentEntity(EntityFolder e) {
    _currentEntity = e;
    notifyListeners();
  }
}
