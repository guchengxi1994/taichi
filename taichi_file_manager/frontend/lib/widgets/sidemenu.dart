import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:provider/provider.dart';
import 'package:taichi/taichi.dart' show TaichiGraph;
import 'package:taichi_file_manager/app_style.dart';
import 'package:taichi_file_manager/models/my_tree_node.dart';

import '../controllers/file_tree_controller.dart';
import '../utils/common.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final Key _key = const ValueKey(22);
  final TreeController _controller = TreeController(allNodesExpanded: true);
  final ScrollController scrollbarController = ScrollController();
  final ScrollController menubarController = ScrollController();
  GlobalKey treeKey = GlobalKey();
  double height = 0;
  bool isCollapsed = false;

  @override
  void dispose() {
    scrollbarController.dispose();
    menubarController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget buildTree() {
    return SizedBox(
      width: AppStyle.sidemenuWidth,
      child: Scrollbar(
        controller: scrollbarController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollbarController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            controller: menubarController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: AppStyle.sidemenuWidth,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TaichiGraph.simple(size: 100),
                  ),
                ),
                TreeView(
                  treeController: _controller,
                  nodes: [
                    MyTreeNode(
                        content: InkWell(
                          onTap: () {
                            if (!isCollapsed) {
                              _controller.collapseAll();
                            } else {
                              _controller.expandAll();
                            }

                            isCollapsed = !isCollapsed;

                            setState(() {});

                            context
                                .read<FileTreeController>()
                                .changeTreeNodeName("Root");
                          },
                          child: const Text(
                            "Root",
                            style: AppStyle.form2CommonTitle,
                          ),
                        ),
                        nodeName: 'Root'),
                    TreeNode(
                      content: Icon(Icons.audiotrack),
                      children: [
                        TreeNode(content: Text("node 21")),
                        TreeNode(
                          content: Text("node 22"),
                          key: _key,
                          children: [
                            TreeNode(
                              content: Icon(Icons.sentiment_very_satisfied),
                            ),
                          ],
                        ),
                        TreeNode(content: Text("node 23"), children: [
                          TreeNode(
                              content: Icon(Icons.sentiment_very_satisfied),
                              children: [
                                TreeNode(
                                  content:
                                      Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                                ),
                              ]),
                        ]),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<TreeNode> toTreeNodes(dynamic parsedJson) {
    if (parsedJson is Map<String, dynamic>) {
      return parsedJson.keys
          .map((k) => TreeNode(
              content: Text('$k:'), children: toTreeNodes(parsedJson[k])))
          .toList();
    }
    if (parsedJson is List<dynamic>) {
      return parsedJson
          .asMap()
          .map((i, element) => MapEntry(i,
              TreeNode(content: Text('[$i]:'), children: toTreeNodes(element))))
          .values
          .toList();
    }
    return [TreeNode(content: Text(parsedJson.toString()))];
  }

  Widget buildTree2() {
    try {
      var parsedJson = json.decode("""
{"Root": {
    "2020": [
      {"1":["1.txt","2.txt"]},
      {"2":["1.txt","2.txt"]}
    ],
    "level": 56,
    "married": true,
    "hobby": null
  }}
""");
      return TreeView(
        nodes: toTreeNodes(parsedJson),
        treeController: _controller,
      );
    } on FormatException catch (e) {
      return Text(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppStyle.lightBlue,
      child: buildTree2(),
    );
  }
}
