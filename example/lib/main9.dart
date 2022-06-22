// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:taichi/src/UI/dropdown_search/text_field.dart';
// import 'package:taichi/src/UI/dropdown_search/search_box.dart';
// import 'package:taichi/src/UI/dropdown_search/dropdown_search_provider.dart';

import 'package:taichi/src/UI/dropdown_search/dropdown_search.dart';

void main() => runApp(
      const MyApp(),
    );

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> l = ["I", "love", "China"];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => DropdownSearchController()..init(l),
    //   builder: (c, s) {
    //     return Scaffold(
    //       body: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             DropdownSearchTextField(
    //               hintText: "do_something",
    //               controller: controller,
    //             ),
    //             SearchBox(
    //               searchStr: c.watch<DropdownSearchController>().searchStr,
    //               onItemTap: (index) {
    //                 controller.text =
    //                     c.read<DropdownSearchController>().fliteredData[index];
    //               },
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );

    return Scaffold(
      body: Row(
        children: [Expanded(child: Container()), DropDownSearch(datas: l)],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
