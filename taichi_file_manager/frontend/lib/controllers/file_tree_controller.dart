import 'package:flutter/material.dart';

class FileTreeController extends ChangeNotifier {
  String _currentTreeNodeName = "";
  String get currentTreeNodeName => _currentTreeNodeName;

  changeTreeNodeName(String s) {
    _currentTreeNodeName = s;
    notifyListeners();
  }
}
