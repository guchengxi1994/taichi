import 'package:flutter/material.dart';

class BaseInfoWidget extends StatefulWidget {
  const BaseInfoWidget({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;
  @override
  State<BaseInfoWidget> createState() => _BaseInfoWidgetState();
}

class _BaseInfoWidgetState extends State<BaseInfoWidget> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String email = "";

  @override
  void initState() {
    super.initState();
    userController.text = "xiaoshuyui";
    emailController.text = "test@xiaoshuyui.cn";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: '用户名',
              ),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '请输入用户名';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'email',
              ),
              validator: (value) {
                RegExp reg = RegExp(
                    r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$');
                if (value != null && !reg.hasMatch(value)) {
                  return '请输入正确的email地址';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
