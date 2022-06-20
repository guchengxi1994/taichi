import 'package:flutter/material.dart';

/// this is for test
class ReservedScreen extends StatelessWidget {
  const ReservedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("this is a reserved page for test"),
          // TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: const Text("返回"))
        ],
      ),
    );
  }
}
