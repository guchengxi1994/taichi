import 'package:flutter/material.dart';

class ShadowImageView extends StatefulWidget {
  const ShadowImageView({Key? key}) : super(key: key);

  @override
  ShadowImageViewState createState() => ShadowImageViewState();
}

class ShadowImageViewState extends State<ShadowImageView> {
  Color shadowColor = Colors.grey;
  double radius = 20;

  String imgPath = 'packages/taichi_board_designer/assets/demo.png';
  double factor = 1.04;
  double imgSize = 300;

  changeRadius(double data) {
    setState(() {
      radius = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: imgSize * factor,
          width: imgSize * factor,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [BoxShadow(color: shadowColor, blurRadius: 20)],
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.fill)),
        ),
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        //   child: Container(
        //     color: Colors.white.withOpacity(0.1),
        //     width: imgSize * factor,
        //     height: imgSize * factor,
        //   ),
        // ),
        Positioned(
            left: 0.5 * (imgSize * factor - imgSize),
            top: 0.5 * (imgSize * factor - imgSize),
            child: Container(
              height: imgSize,
              width: imgSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  // boxShadow: [BoxShadow(color: shadowColor, blurRadius: 20)],
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.fill)),
            ))
      ],
    );
  }
}
