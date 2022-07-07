/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-13 20:48:03
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-06-13 21:56:56
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taichi_accessible_widget/lib.dart';

import '../utils/common.dart';

class UserDropdownButton extends StatelessWidget {
  const UserDropdownButton({Key? key, required this.type}) : super(key: key);
  final ScreenType type;

  List<DropdownMenuItem> generateItemList(BuildContext context) {
    final List<DropdownMenuItem> items = [];
    final DropdownMenuItem item1 = DropdownMenuItem(
      onTap: () {
        debugPrint("clicked pop");
        Navigator.of(context).pop();
      },
      value: '登出',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.logout,
            color: Colors.black,
          ),
          Text('登出')
        ],
      ),
    );
    final DropdownMenuItem item2 = DropdownMenuItem(
      onTap: () {
        if (context.read<AccessController>().role == "admin") {
          context.read<AccessController>().changeRole("test user");
        } else {
          context.read<AccessController>().changeRole("admin");
        }
        debugPrint("[length]:${context.read<AccessController>().role}");
      },
      value: '切换账户',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.switch_account,
            color: Colors.black,
          ),
          Text('切换账户')
        ],
      ),
    );

    items.add(item1);
    items.add(item2);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (type != ScreenType.mobile) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 90, 76, 76), width: 1),
            color: const Color.fromARGB(255, 111, 154, 179),
            borderRadius: BorderRadius.circular((15.0))),
        height: 50,
        child: DropdownButton<dynamic>(
          items: generateItemList(context),
          onChanged: (v) {
            // print(v);
          },
          underline: Container(),
          icon: Transform.rotate(
            angle: -3.1415 * 0.5,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          hint: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      "assets/images/0.jpg",
                    ))),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "XiaoShuYuI",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 90, 76, 76), width: 1),
              color: const Color.fromARGB(255, 111, 154, 179),
              borderRadius: BorderRadius.circular((15.0))),
          height: 50,
          child: DropdownButton<dynamic>(
            items: generateItemList(context),
            onChanged: (v) {
              // print(v);
            },
            underline: Container(),
            icon: Transform.rotate(
              angle: -3.1415 * 0.5,
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
            hint: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                    "assets/images/0.jpg",
                  ))),
            ),
          ));
    }
  }
}
