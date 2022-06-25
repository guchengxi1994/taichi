import 'package:flutter/material.dart';

typedef StringCallback = Function(String s);

class DropdownSearchTextField extends StatelessWidget {
  const DropdownSearchTextField(
      {Key? key,
      required this.controller,
      this.width = 300,
      this.height = 50,
      this.hintText = "",
      required this.onIconTap,
      this.onTextChange})
      : super(key: key);
  final TextEditingController controller;
  final double width;
  final double height;
  final String hintText;
  final VoidCallback onIconTap;
  final StringCallback? onTextChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white24,
      child: TextField(
        controller: controller,
        onChanged: (s) {
          if (onTextChange != null) {
            onTextChange!(s);
          }
        },
        decoration: InputDecoration(
          // labelText: "用户名",
          hintText: hintText,
          border: const OutlineInputBorder(),
          suffixIcon: InkWell(
            onTap: onIconTap,
            child: Transform.rotate(
              angle: 3.1415 / 2,
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ),
    );
  }
}
