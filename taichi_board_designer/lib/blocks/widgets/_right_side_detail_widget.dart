import 'package:flutter/material.dart';
import '../providers/_right_side_widget_controller.dart';
import '_image_shadow_view.dart';

class RightSideDetaiWidget extends StatefulWidget {
  const RightSideDetaiWidget({Key? key, required this.controller})
      : super(key: key);
  final RightSideWidgetController controller;

  @override
  State<RightSideDetaiWidget> createState() => _RightSideDetaiWidgetState();
}

class _RightSideDetaiWidgetState extends State<RightSideDetaiWidget> {
  late RightSideWidgetController controller;
  GlobalKey<ShadowImageViewState> imgViewKey = GlobalKey();
  double _slideValue = 20.0;
  @override
  void initState() {
    super.initState();
    controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("详细属性修改",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          const SizedBox(
            height: 5,
          ),
          Text(
            "当前Widget类型:  ${controller.widgetType}",
            maxLines: 2,
          ),
          ShadowImageView(
            key: imgViewKey,
          ),
          Slider(
              value: _slideValue,
              min: 10,
              max: 100,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()} dollars}';
              },
              onChanged: (data) {
                setState(() {
                  _slideValue = data;
                });
                imgViewKey.currentState!.changeRadius(data);
              }),
        ],
      ),
    );
  }
}
