import 'package:flutter/material.dart';

class BasicWidget {
  static Widget main(double size, Color backgroundColor,
      {Color mainColor = Colors.blue}) {
    return Container(
        height: size,
        width: 0.75 * size,
        color: Colors.transparent,
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Stack(children: [
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 0.5 * size,
                  height: size,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(size),
                        topLeft: Radius.circular(size)),
                  ),
                )),
            Positioned(
                top: 0,
                right: 0.24 * size,
                child: Container(
                  width: 0.27 * size,
                  height: 0.5 * size,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size),
                        bottomLeft: Radius.circular(size)),
                  ),
                )),
          ]),
        ));
  }

  static Widget extra(double size, {Color mainColor = Colors.blue}) {
    return Container(
      width: 0.25 * size,
      height: 0.5 * size,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(size),
            topRight: Radius.circular(size)),
      ),
    );
  }
}
