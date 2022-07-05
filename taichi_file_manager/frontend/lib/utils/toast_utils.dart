import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(String message, {Color? color}) async {
  await Fluttertoast.showToast(backgroundColor: color, msg: message);
}
