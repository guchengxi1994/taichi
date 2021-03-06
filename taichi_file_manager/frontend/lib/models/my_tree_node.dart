/// modified from https://github.com/guchengxi1994/a-cool-app/blob/dev/frontend/codind/lib/pages/module_pages/file_explore_page.dart

// ignore_for_file: unnecessary_overrides, no_leading_underscores_for_local_identifiers, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/controllers/file_tree_controller.dart';

import 'file_response.dart';

enum FileType { folder, file }

class CanOperateFiles {
  bool canOperate;
  String? message;
  CanOperateFiles({required this.canOperate, this.message});
}

class EntityFolder {
  String name = "空文件夹";
  List<Object> children = [];
  String fatherPath = 'root';
  int depth = 0;
  EntityFolder(
      {required this.name,
      required this.depth,
      required this.children,
      required this.fatherPath});

  CanOperateFiles addFile(Object fileOrFolder, {bool? force}) {
    if (fileOrFolder.runtimeType != EntityFile &&
        fileOrFolder.runtimeType != EntityFolder) {
      return CanOperateFiles(canOperate: false, message: "Cannot operate");
    }
    if (force != null) {
      if (force) {
        if (!children.contains(fileOrFolder)) {
          children.add(fileOrFolder);
        } else {
          children.remove(fileOrFolder);
          children.add(fileOrFolder);
        }
      } else {
        if (!children.contains(fileOrFolder)) {
          children.add(fileOrFolder);
        } else {
          if (fileOrFolder.runtimeType == EntityFolder) {
            EntityFolder _en =
                children.firstWhere((element) => element == fileOrFolder)
                    as EntityFolder;
            _en.children.addAll((fileOrFolder as EntityFolder).children);
            children.remove(fileOrFolder);
            children.add(_en);
          } else {
            children.remove(fileOrFolder);
            children.add(fileOrFolder);
          }
        }
      }

      return CanOperateFiles(canOperate: true, message: "");
    }

    if (!children.contains(fileOrFolder)) {
      children.add(fileOrFolder);
      return CanOperateFiles(canOperate: true, message: "");
    } else {
      return CanOperateFiles(
          canOperate: false, message: "Already has same file/folder");
    }
  }

  TreeNode toTreeNode(BuildContext context) {
    if (hasChildren) {
      final childNodes = children.map((e) {
        if (e.runtimeType == EntityFolder) {
          return (e as EntityFolder).toTreeNode(context);
        } else {
          return (e as EntityFile).toTreeNode(context);
        }
      }).toList();
      return TreeNode(
          content: InkWell(
            onTap: () {
              context.read<FileTreeController>().changeTreeNodeName(name);
              context.read<FileTreeController>().changeCurrentEntity(this);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.folder_open,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(name)
              ],
            ),
          ),
          children: childNodes);
    } else {
      return TreeNode(
          content: InkWell(
            onTap: () {
              context.read<FileTreeController>().changeTreeNodeName(name);
              context.read<FileTreeController>().changeCurrentEntity(this);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.folder_off,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(name)
              ],
            ),
          ),
          children: []);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['children'] = children.map((v) {
      // return v.toJson();
      if (v.runtimeType == EntityFolder) {
        return (v as EntityFolder).toJson();
      } else {
        return (v as EntityFile).toJson();
      }
    }).toList();
    data['depth'] = depth;
    data['fatherPath'] = fatherPath;
    return data;
  }

  bool get hasChildren => children.isNotEmpty;

  EntityFolder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        if ((v as Map<String, dynamic>).containsKey("timestamp")) {
          children.add(EntityFile.fromJson(v));
        } else {
          children.add(EntityFolder.fromJson(v));
        }
      });
    }
    depth = json['depth'];
    fatherPath = json['fatherPath'];
  }

  @override
  int get hashCode => super.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType == EntityFolder) {
      return (other as EntityFolder).name == name && (other).depth == depth;
    } else {
      return false;
    }
  }
}

FlattenObject flatten(EntityFolder entityFolder) {
  var names = _getPath(entityFolder);
  names = names.toSet().toList();
  // print(names);
  var files = _getFiles(entityFolder);
  // names = _merge(names);
  return FlattenObject(files: files, path: names);
}

List<String> _getPath(EntityFolder entityFolder) {
  List<String> names = [];

  for (var i in entityFolder.children) {
    if (i.runtimeType == EntityFile) {
      names.add("${(i as EntityFile).fatherPath}/${i.name}");
      names.add((i).fatherPath);
    } else {
      if (!(i as EntityFolder).hasChildren) {
        var s = "${i.fatherPath}/${i.name}";
        names.add(s);
      } else {
        names.addAll(_getPath(i));
      }
    }
  }

  return names;
}

List<EntityFile> _getFiles(EntityFolder entityFolder) {
  List<EntityFile> names = [];

  if (entityFolder.hasChildren) {
    for (var i in entityFolder.children) {
      if (i.runtimeType == EntityFile) {
        names.add(i as EntityFile);
      } else {
        if (!(i as EntityFolder).hasChildren) {
          continue;
        } else {
          names.addAll(_getFiles(i));
        }
      }
    }
  }
  return names;
}

class FlattenObject {
  List<String> path;
  List<EntityFile> files;

  FlattenObject({this.files = const [], this.path = const []});

  @override
  String toString() {
    return path.toString() + files.map((e) => e.toJson()).toList().toString();
  }
}

EntityFolder? toStructured(FlattenObject object,
    {String? newPath, EntityFile? newFile}) {
  if (newFile != null) {
    object.path.add(newPath!);
    object.files.add(newFile);
  }

  if (newPath != null && !isAFile(newPath)) {
    object.path.add(newPath);
  }

  List<EntityFolder> allFolders = [];

  EntityFolder entityFolder =
      EntityFolder(fatherPath: "", name: "root", children: [], depth: 0);

  allFolders.add(entityFolder);

  // Map<String, dynamic> _json = entityFolder.toJson();
  int maxDepth = 0;
  for (var s in object.path) {
    if (!isAFile(s)) {
      // print(s);
      var slist = s.split("/");
      // print(s);
      // slist.remove("..");
      // slist.remove("root");

      for (int i = 2; i < slist.length; i++) {
        EntityFolder _en;
        if (i == 2) {
          _en = EntityFolder(
              name: slist[i],
              depth: i - 1,
              children: [],
              fatherPath: '../root');
          if (maxDepth <= _en.depth) maxDepth = _en.depth;
        } else {
          var name = slist[i];
          var fatherPath = '';
          for (int j = 0; j < i; j++) {
            if (j == 0) {
              fatherPath = fatherPath + slist[j];
            } else {
              fatherPath = "$fatherPath/${slist[j]}";
            }
          }
          _en = EntityFolder(
              name: name, depth: i - 1, children: [], fatherPath: fatherPath);
          if (maxDepth <= _en.depth) maxDepth = _en.depth;
        }
        // print("[dddd]:${_en.toJson()}");
        if (!allFolders.contains(_en)) allFolders.add(_en);
      }
    }
  }
  // print(allFolders.length);

  // _depthEntityMap[1] = [entityFolder];

  Map<int, List<EntityFolder>> _depthEntityMap = {};
  _depthEntityMap[0] = [entityFolder];

  for (int i = 1; i <= maxDepth; i++) {
    List<EntityFolder> _res =
        allFolders.where((element) => element.depth == i).toList();
    _depthEntityMap[i] = _res;
  }

  // print(_depthEntityMap);

  generateFromMap(_depthEntityMap, maxDepth, object.files);
  // print(jsonEncode(_depthEntityMap[0]![0].toJson()));

  return EntityFolder.fromJson(_depthEntityMap[0]![0].toJson());
}

void generateFromMap(Map<int, List<EntityFolder>> depthEntityMap, int maxDepth,
    List<EntityFile> files) {
  // print(maxDepth);
  for (int index = maxDepth; index >= 0; index--) {
    if (index > 0) {
      for (var j in depthEntityMap[index]!) {
        for (var i in depthEntityMap[index - 1]!) {
          // List<EntityFile> caches = [];

          for (var f in files) {
            if (f.fatherPath.endsWith("${j.fatherPath}/${j.name}")) {
              j.addFile(f);
              // caches.add(f);
            }
          }

          if (j.fatherPath.endsWith(i.name)) {
            i.children.add(j);
          }
        }
      }
    } else {
      for (var j in depthEntityMap[index]!) {
        for (var f in files) {
          if (f.fatherPath.endsWith("${j.fatherPath}/${j.name}")) {
            j.addFile(f);
            // caches.add(f);
          }
        }
      }
    }
  }
}

void _addFile(
  EntityFolder father,
  List<String> names,
  List<EntityFile> files,
) {
  if (names.isNotEmpty) {
    var listCopy = names;

    EntityFolder entity = EntityFolder(
        name: listCopy[0],
        depth: father.depth + 1,
        children: [],
        fatherPath: father.name);

    if (!father.children.contains(entity)) {
      father.addFile(entity, force: true);
    }

    if (listCopy.length > 1) {
      listCopy.removeAt(0);
      _addFile(entity, listCopy, files);
    }
  }
}

void _addFileMap(Map<String, dynamic> father, List<String> names) {
  var listCopy = names;
  EntityFolder entity = EntityFolder(
      name: listCopy[0],
      depth: father['depth'] + 1,
      children: [],
      fatherPath: father['name']);
  if (!father['children'].contains(entity.toJson())) {
    father['children'].add(entity.toJson());
  }

  if (listCopy.length > 1) {
    listCopy.removeAt(0);
    _addFileMap(entity.toJson(), listCopy);
  }
}

class EntityFile {
  String name = "新建文档.md";

  /// 实际保存的物理路径
  String? savePath;

  /// 标签
  List<String>? tags;

  int depth = 0;

  String fatherPath = "root";

  String timestamp = "2015-06-07 08:09:10";

  EntityFile.fromSavedFile(SavedFiles s) {
    name = s.name!;
    savePath = s.savePath;
    tags = s.tags;
    depth = s.depth!;
    fatherPath = s.fatherPath!;
    timestamp = s.timestamp!;
  }

  TreeNode toTreeNode(BuildContext context) {
    return TreeNode(
        content: InkWell(
      onTap: () {
        context.read<FileTreeController>().changeTreeNodeName(name);
        debugPrint("这里要去打开特定文件");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.file_present,
            color: Colors.black,
          ),
          Text(name)
        ],
      ),
    ));
  }

  EntityFile(
      {required this.name,
      this.savePath = "",
      this.tags = const [],
      required this.timestamp,
      required this.depth,
      required this.fatherPath});

  EntityFile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    savePath = json['savePath'];
    depth = json['depth'];
    fatherPath = json['fatherPath'];
    timestamp = json['timestamp'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['savePath'] = savePath;
    data['depth'] = depth;
    data['fatherPath'] = fatherPath;
    data['timestamp'] = timestamp;
    data['tags'] = tags;
    return data;
  }

  @override
  int get hashCode => super.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType == EntityFile) {
      return (other as EntityFile).name == name && (other).depth == depth;
    } else {
      return false;
    }
  }
}

EntityFolder? fromJsonToEntityAdd(String jsonStr, String fatherPath, int depth,
    Object object, String originJsonStr) {
  if (object.runtimeType != EntityFile && object.runtimeType != EntityFolder) {
    // showToastMessage("输入的类型不符", null);
    return null;
  }

  // print(fatherPath);
  Map<String, dynamic> data = json.decode(jsonStr);
  EntityFolder entityFolder = EntityFolder.fromJson(data);
  if (fatherPath == "root") {
    CanOperateFiles canOperateFiles = entityFolder.addFile(object);
    if (!canOperateFiles.canOperate) {
      // showToastMessage(canOperateFiles.message ?? "error", null);
      return null;
    } else {
      return entityFolder;
    }
  } else {
    String fath = fatherPath.split("/").last;
    Map<String, dynamic> _data = json.decode(originJsonStr);
    EntityFolder _en = EntityFolder.fromJson(_data);

    originJsonStr = json.encode(_en.toJson());

    if (fath == entityFolder.name && depth == entityFolder.depth + 1) {
      // print("要执行这个!");
      CanOperateFiles canOperateFiles = entityFolder.addFile(object);
      if (!canOperateFiles.canOperate) {
        // showToastMessage(canOperateFiles.message ?? "error", null);
        return null;
      } else {
        // print(jsonStr);
        // print(json.encode(entityFolder.toJson()));
        // print(originJsonStr.contains(jsonStr));
        var _s = originJsonStr.replaceAll(
            jsonStr, json.encode(entityFolder.toJson()));

        // print(_s);
        // print("=====================");

        return EntityFolder.fromJson(json.decode(_s));
      }
    } else {
      var _list =
          entityFolder.children.where((e) => e.runtimeType == EntityFolder);
      for (var j in _list) {
        if (depth == (j as EntityFolder).depth && fatherPath == fath) {
          EntityFolder _j = j;
          CanOperateFiles canOperateFiles = _j.addFile(object);
          if (canOperateFiles.canOperate) {
            entityFolder.children.remove(j);
            entityFolder.children.add(_j);
          } else {
            // showToastMessage(canOperateFiles.message ?? "error", null);
          }
          break;
        } else {
          return fromJsonToEntityAdd(
              jsonEncode((j).toJson()), fath, depth, object, originJsonStr);
        }
      }
      // print(jsonStr);
      // print(json.encode(entityFolder.toJson()));

      String _s = originJsonStr.replaceFirst(
          jsonStr, json.encode(entityFolder.toJson()));
      return EntityFolder.fromJson(json.decode(_s));
    }
  }
}

bool isAFile(String s) {
  if (s.length <= 2) {
    return false;
  } else {
    var _tmp = s.substring(3);
    return _tmp.contains(".");
  }
}

extension FindObject on EntityFolder {
  Object? findObject(int dep, String objectName) {
    if (depth == dep && name == objectName) {
      return this;
    }

    for (var i in children) {
      if (i is EntityFile) {
        if (i.depth == dep && i.name == objectName) {
          return i;
        } else {
          continue;
        }
      }

      if (i is EntityFolder) {
        if (i.depth == dep && i.name == objectName) {
          return i;
        } else {
          var r = (i).findObject(dep, objectName);
          if (r != null) {
            return r;
          } else {
            continue;
          }
        }
      }
    }

    return null;
  }
}

extension FindParent on EntityFile {
  EntityFolder? findParent(EntityFolder en) {
    if (depth == en.depth + 1 && fatherPath.endsWith(en.name)) {
      return en;
    }

    for (var i in en.children) {
      if (i is EntityFile) {
        continue;
      } else {
        var f = findParent(i as EntityFolder);
        if (f != null) {
          return f;
        } else {
          continue;
        }
      }
    }

    return null;
  }
}
