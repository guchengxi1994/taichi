import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';

class MyTreeNode extends TreeNode {
  String nodeName;

  MyTreeNode(
      {List<MyTreeNode>? children,
      required Widget content,
      Key? key,
      required this.nodeName})
      : super(children: children, content: content, key: key);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {};
    if (children == null || children!.isEmpty) {
      return {"root": []};
    }

    return result;
  }
}
