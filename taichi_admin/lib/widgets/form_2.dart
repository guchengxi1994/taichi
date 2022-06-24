import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart' show TaichiDevUtils, SimpleDatePicker;
import 'package:taichi_admin/app_style.dart';

class DetailedInfoWidget extends StatefulWidget {
  const DetailedInfoWidget({Key? key}) : super(key: key);

  @override
  State<DetailedInfoWidget> createState() => _DetailedInfoWidgetState();
}

class _DetailedInfoWidgetState extends State<DetailedInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "上传头像",
          style: AppStyle.form2CommonTitle,
        ),
        const SizedBox(
          height: 20,
        ),
        ImageWidgetV2(
          data: null,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "生日",
          style: AppStyle.form2CommonTitle,
        ),
        const SizedBox(
          height: 10,
        ),
        SimpleDatePicker(),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "balababa...",
          style: AppStyle.form2CommonTitle,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: TextFormField(
            autofocus: true,
            autocorrect: false,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 8,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// copied from https://github.com/guchengxi1994/a-cool-app
// ignore: must_be_immutable
class ImageWidgetV2 extends StatefulWidget {
  ImageWidgetV2({
    Key? key,
    required this.data,
    this.height,
    this.width,
    this.isMulti,
  }) : super(key: key);
  Uint8List? data;
  double? height;
  double? width;
  // for multi-file
  bool? isMulti;

  @override
  State<ImageWidgetV2> createState() => _ImageWidgetV2State();
}

class _ImageWidgetV2State extends State<ImageWidgetV2> {
  late Uint8List? data;
  late String imageName;

  @override
  void initState() {
    data = widget.data;
    imageName = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 150,
      width: widget.width ?? 120,
      decoration: BoxDecoration(
          image: data != null
              ? DecorationImage(image: MemoryImage(data!), fit: BoxFit.cover)
              : null,
          color: const Color.fromARGB(255, 216, 203, 203),
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: data != null
          ? Stack(children: [
              Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFFF0000), width: 0.5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular((10.0))),
                    child: IconButton(
                      iconSize: 24,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          data = null;
                        });
                      },
                    ),
                  ))
            ])
          : IconButton(
              onPressed: () async {
                try {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    if (!TaichiDevUtils.isWeb) {
                      imageName = result.files.single.path!;
                      File file = File(imageName);
                      data = await file.readAsBytes();

                      setState(() {});
                    } else {
                      data = result.files.first.bytes;
                      imageName = result.files.first.name;

                      setState(() {});
                    }
                  }
                } catch (_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('not a image'),
                  ));
                }
              },
              icon: const Icon(
                Icons.add,
                size: 50,
              )),
    );
  }
}
