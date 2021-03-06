// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_file_manager/app_style.dart';
import 'package:taichi_file_manager/controllers/file_tree_controller.dart';
import 'package:taichi_file_manager/controllers/role_controller.dart';
import 'package:taichi_file_manager/models/bug_req.dart';
import 'package:taichi_file_manager/models/my_tree_node.dart';
import 'package:taichi_file_manager/routers.dart';
import 'package:taichi_file_manager/utils/common.dart';
import 'package:taichi_file_manager/utils/dio_utils.dart';

import '../api.dart';

class MainScreenAppbar extends StatelessWidget {
  MainScreenAppbar({Key? key, required this.type}) : super(key: key);
  final ScreenType type;
  final DioUtils dioUtils = DioUtils();
  final TextEditingController controller = TextEditingController();
  final TextEditingController folderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: type != ScreenType.desktop,
      backgroundColor: AppStyle.lightBlue,
      title: Text(context.watch<FileTreeController>().currentTreeNodeName),
      centerTitle: false,
      elevation: type == ScreenType.mobile ? 4 : 0,
      // actions: buildAppbarActions(),
      actions: [
        IconButton(
            tooltip: "报告bug",
            onPressed: () {
              if (!context.read<RoleController>().isDeveloper) {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return UnconstrainedBox(
                          child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Dialog(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Bug summary",
                                    style: AppStyle.form2CommonTitle,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    child: TextField(
                                      cursorColor: Colors.blue,
                                      cursorHeight: 30,
                                      cursorRadius: const Radius.circular(10),
                                      cursorWidth: 2,
                                      showCursor: true,
                                      maxLines: null,
                                      maxLength: 200,
                                      controller: controller,
                                      decoration: const InputDecoration(
                                          isCollapsed: false,
                                          labelText: "Bug summary",
                                          contentPadding: EdgeInsets.all(10),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red))),
                                    ),
                                  ),
                                  const Text(
                                    "Bug details",
                                    style: AppStyle.form2CommonTitle,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    child: SelectableText(
                                      jsonEncode(context
                                          .read<FileTreeController>()
                                          .structure!
                                          .toJson()),
                                      maxLines: null,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(0);
                                          },
                                          child: const Text("取消")),
                                      TextButton(
                                          onPressed: () async {
                                            BugReq bugReq = BugReq();
                                            bugReq.bugContent = jsonEncode(
                                                context
                                                    .read<FileTreeController>()
                                                    .structure!
                                                    .toJson());
                                            bugReq.bugSummary = controller.text;
                                            await dioUtils.post(
                                                Server + Apis["bugreport"]!,
                                                data: bugReq.toJson());
                                            Navigator.of(context).pop(1);
                                          },
                                          child: const Text("确定")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                    });
              } else {
                Navigator.of(context).pushNamed(Routers.bug);
              }
            },
            icon: const Icon(Icons.bug_report)),
        IconButton(
            tooltip: "在此处添加一个逻辑目录",
            onPressed: () async {
              await showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text("逻辑目录如果为空，将不会存入数据库"),
                      content: Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Center(
                            child: TextField(
                              cursorColor: Colors.blue,
                              cursorHeight: 30,
                              cursorRadius: const Radius.circular(10),
                              cursorWidth: 2,
                              showCursor: true,
                              maxLines: null,
                              maxLength: 20,
                              controller: folderController,
                              decoration: const InputDecoration(
                                  isCollapsed: false,
                                  labelText: "输入文件夹名",
                                  contentPadding: EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            )),
                        CupertinoActionSheetAction(
                            onPressed: () {
                              EntityFolder en = EntityFolder(
                                  name: folderController.text,
                                  depth:
                                      context.read<FileTreeController>().depth!,
                                  children: [],
                                  fatherPath: context
                                      .read<FileTreeController>()
                                      .currentFatherPath!);

                              addALogicalFolder(
                                  context,
                                  en,
                                  context
                                      .read<FileTreeController>()
                                      .currentFatherPath!,
                                  context.read<FileTreeController>().depth!);

                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.done,
                              color: Colors.green,
                            )),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.add_box)),
        IconButton(
            tooltip: "上传一个文件",
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                Uint8List? fileBytes = result.files.first.bytes;
                String fileName = result.files.first.name;
                debugPrint("[filename]:$fileName");

                await showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("选取文件名"),
                        content: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 200,
                            height: 150,
                            child: Center(
                              child: Text(
                                fileName,
                                maxLines: null,
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.red,
                              )),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                EntityFile en = EntityFile(
                                    name: fileName,
                                    savePath: fileName,
                                    depth: context
                                        .read<FileTreeController>()
                                        .depth!,
                                    fatherPath: context
                                        .read<FileTreeController>()
                                        .currentFatherPath!,
                                    timestamp: DateTime.now().toString(),
                                    tags: []);

                                addAFile(
                                    context,
                                    en,
                                    context
                                        .read<FileTreeController>()
                                        .currentFatherPath!,
                                    context.read<FileTreeController>().depth!);

                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.done,
                                color: Colors.green,
                              )),
                        ],
                      );
                    });
              }
            },
            icon: const Icon(Icons.add)),
        IconButton(
            tooltip: "同步数据", onPressed: () {}, icon: const Icon(Icons.sync)),
      ],
    );
  }

  addALogicalFolder(
      BuildContext context, EntityFolder e, String fatherPath, int depth) {
    var res = context.read<FileTreeController>().structure;
    if (res != null) {
      var _addFile = "${e.fatherPath}/${e.name}";
      // print(_addFile);
      var flattenObj = flatten(res);
      flattenObj.path.add(_addFile);
      // print(flattenObj.toString());

      EntityFolder? en = toStructured(flattenObj);
      // debugPrint("[res]:${e.toJson()}");
      if (en != null) {
        context.read<FileTreeController>().changeTree(en);
        Object? fo = en.findObject(depth, e.name);
        // print(fo);
        if (fo != null && fo is EntityFolder) {
          context.read<FileTreeController>().changeCurrentEntity(fo);
        }
      }
    }
  }

  addAFile(BuildContext context, EntityFile e, String fatherPath, int depth) {
    var res = context.read<FileTreeController>().structure;
    if (res != null) {
      var _addFile = "${e.fatherPath}/${e.name}";
      var flattenObj = flatten(res);
      flattenObj.files.add(e);
      flattenObj.path.add(_addFile);
      EntityFolder? en = toStructured(flattenObj);
      if (en != null) {
        context.read<FileTreeController>().changeTree(en);

        EntityFolder? fo = e.findParent(en);
        // print(f?.toJson());
        if (fo != null) {
          context.read<FileTreeController>().changeCurrentEntity(fo);
        }
      }
    }
  }
}
