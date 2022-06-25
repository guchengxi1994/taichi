import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi/src/UI/dropdown_search/dropdown_search_provider.dart';

typedef TextCallback = void Function(String s);

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
  final TextCallback? onTextChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white24,
      child: TextField(
        controller: controller,
        onChanged: (s) {
          context.read<DropdownSearchController>().changeSearchCondition(s);
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
