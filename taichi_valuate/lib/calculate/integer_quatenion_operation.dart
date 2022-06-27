// ignore_for_file: prefer_final_locals, parameter_assignments, avoid_print

import 'package:taichi_valuate/calculate/abstract_operation.dart';

/// modified from https://www.jianshu.com/p/2803901ef9e0
///
/// original version was written by java
class IntegerQuatenionOperation extends AbstractOperation {
  IntegerQuatenionOperation({required String expression})
      : super(expression: expression);

  @override
  int? getResult() {
    try {
      return _getVal(expression, 0)[0];
    } catch (e, s) {
      print(s);
      return null;
    }
  }

  List<int> _getVal(String str, int i) {
    List<String> que = [];
    int pre = 0;
    List<int> bra = [];
    while (i < str.length && str[i] != ")") {
      if (["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(str[i])) {
        pre = pre * 10 + int.parse(str[i++]);
      } else if (str[i] != "(") {
        _addNum(que, pre);
        que.add(str[i++]);
        pre = 0;
      } else {
        bra = _getVal(str, i + 1);
        pre = bra[0];
        i = bra[1] + 1;
      }
    }
    _addNum(que, pre);
    return [_getNum(que), i];
  }

  int _getNum(List<String> que) {
    int res = 0;
    bool add = true;
    String? cur;
    int n = 0;
    while (que.isNotEmpty) {
      cur = que.removeAt(0);
      if (cur == "+") {
        add = true;
      } else if (cur == "-") {
        add = false;
      } else {
        n = int.parse(cur);
        res += add ? n : (-n);
      }
    }

    return res;
  }

  void _addNum(List<String> que, int n) {
    if (que.isNotEmpty) {
      int cur = 0;
      String top = que.removeLast();
      if (top == "+" || top == "-") {
        que.add(top);
      } else {
        cur = int.parse(que.removeLast());

        if (top == "*") {
          n = cur * n;
        } else {
          if (n != 0) {
            n = (cur / n).round();
          } else {
            throw UnsupportedError("Integer Division By Zero");
          }
        }
      }
    }
    que.add(n.toString());
  }
}
