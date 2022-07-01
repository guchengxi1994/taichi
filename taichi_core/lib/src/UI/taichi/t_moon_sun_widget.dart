part of "taichi.dart";

class _TaichiMoonSunWidget extends StatelessWidget {
  const _TaichiMoonSunWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;
  final Color? color1 = const Color.fromARGB(255, 13, 26, 46);
  final Color? color2 = const Color.fromARGB(255, 176, 232, 243);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          // gradient: const LinearGradient(
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //     colors: [
          //       Color.fromARGB(255, 138, 218, 234),
          //       Color.fromARGB(255, 176, 232, 243),
          //     ]),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 176, 232, 243),
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 15),
          ],
          // color: color2,
          borderRadius: BorderRadius.circular(0.5 * size),
          border: Border.all(color: color1!, width: 1)),
      child: Stack(children: [
        // left side
        Positioned(
            child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size),
              topLeft: Radius.circular(size)),
          child: Container(
              height: size,
              width: 0.5 * size,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [const Color.fromARGB(255, 41, 62, 67), color1!]),
                  border: Border(left: BorderSide(color: color1!)))),
        )),

        // right side
        Positioned(
            top: 0,
            left: 0.5 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(size),
                  topRight: Radius.circular(size)),
              child: Container(
                  height: size - 2,
                  width: 0.5 * size - 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromARGB(255, 138, 218, 234),
                          Color.fromARGB(255, 176, 232, 243),
                        ]),
                  )),
            )),

        // center  circle
        Positioned(
            top: 0,
            left: 0.25 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.25 * size)),
              // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
              child: Container(
                height: 0.5 * size,
                width: 0.5 * size,
                color: Colors.transparent,
              ),
            )),

        Positioned(
            top: 0,
            left: 0.25 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size),
                  topLeft: Radius.circular(size)),
              child: Container(
                  height: size * 0.5,
                  width: 0.25 * size,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 97, 194, 232),
                            Color.fromARGB(255, 138, 218, 234),
                          ]),
                      // color: Colors.transparent,
                      border: Border(left: BorderSide(color: color1!)))),
            )),

        // center  circle
        Positioned(
            bottom: -2,
            right: 0.25 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(size),
                  topRight: Radius.circular(size)),
              // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
              child: Container(
                height: 0.5 * size,
                width: 0.25 * size,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      Color.fromARGB(255, 66, 101, 108),
                      Color.fromARGB(255, 41, 62, 67),
                    ])),
              ),
            )),

        Positioned(
            top: 0.125 * size * 1.5,
            left: 0.5 * size - 0.125 * 0.5 * size,
            height: 0.125 * size,
            width: 0.125 * size,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 10)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.125 * size),
              ),
            )),

        /// small small sun dots
        Positioned(
            top: 0.125 * size * 1.5,
            left: 0.5 * size - 0.125 * 0.5 * size,
            height: 0.125 * size,
            width: 0.125 * size,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 10)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.125 * size),
              ),
            )),

        Positioned(
            top: 0.125 * size * 3,
            left: 0.5 * size + 0.3 * 0.5 * size,
            height: 0.125 * size / 2,
            width: 0.125 * size / 2,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                ),
              ),
            )),

        Positioned(
            top: 0.125 * size * 3.5,
            left: 0.5 * size + 0.45 * 0.5 * size,
            height: 0.125 * size / 4,
            width: 0.125 * size / 4,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                ),
              ),
            )),

        Positioned(
            top: 0.125 * size,
            left: 0.5 * size - 0.25 * 0.5 * size,
            height: 0.125 * size / 8,
            width: 0.125 * size / 8,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                ),
              ),
            )),

        Positioned(
            top: 0.125 * size * 4.5,
            left: 0.5 * size + 0.75 * 0.5 * size,
            height: 0.125 * size / 12,
            width: 0.125 * size / 12,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                ),
              ),
            )),

        /// bottom side
        // small white dot
        Positioned(
            bottom: 0.1 * 1.5 * size,
            left: 0.5 * size - 0.2 * 0.5 * size,
            height: 0.2 * size,
            width: 0.2 * size,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.125 * size),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red[50]!,
                      offset: const Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 2)
                ],
              ),
            )),

        Positioned(
            bottom: 0.1 * 1.5 * size + 5,
            left: 0.5 * size - 0.2 * 0.5 * size - 10,
            height: 0.2 * size,
            width: 0.2 * size,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 62, 67),
                borderRadius: BorderRadius.circular(0.125 * size),
              ),
            )),

        Positioned(
            bottom: 0.1 * 1.5 * size,
            left: 0.5 * size - 0.2 * 0.5 * size,
            height: 0.2 * size,
            width: 0.2 * size,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                ),
              ),
            )),

        /// stars
        Positioned(
            bottom: 0.1 * 1.5 * size,
            left: 0.5 * size - 0.2 * 0.5 * size,
            height: 1,
            width: 1,
            child: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
              ),
            )),

        Positioned(
            bottom: 0.15 * 1.5 * size,
            left: 0.5 * size - 0.3 * 0.5 * size,
            height: 1,
            width: 1,
            child: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0.15 * 1.5 * size,
            left: 0.3 * 0.5 * size,
            height: 1,
            width: 1,
            child: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0.25 * size,
            left: 0.35 * 0.5 * size,
            height: 1,
            width: 1,
            child: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0.45 * size,
            left: 0.45 * 0.5 * size,
            height: 1,
            width: 1,
            child: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0.5 * size,
            left: 0.7 * 0.5 * size,
            height: 1,
            width: 1,
            child: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.125 * size),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
              ),
            )),
        ...buildStars(),
      ]),
    );
  }

  List<Widget> buildStars() {
    List<Widget> results = [];
    for (int i = 0; i < 30; i++) {
      double top = Random().nextInt((1 * size - 50).ceil()) * 1.0 + 50;
      double left = Random().nextInt((0.5 * size - 50).ceil()) * 1.0 + 50;

      if ((top >= 0.65 * size &&
              top <= 0.85 * size &&
              left >= 0.375 * size &&
              left <= 0.625 * size) ||
          (top <= 0.5 * size && left >= 0.2 * size) ||
          (left < 0.1 * size) ||
          (top > 0.9 * size)) {
        continue;
      }

      results.add(Positioned(
          top: top,
          left: left,
          height: 1,
          width: 1,
          child: Opacity(
            opacity: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.125 * size),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
              ),
            ),
          )));
    }
    return results;
  }
}
