part of "taichi.dart";

class _TaichiMoonSunWidget extends StatelessWidget {
  const _TaichiMoonSunWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;
  final Color? color1 = Colors.black;
  final Color? color2 = const Color.fromARGB(255, 176, 232, 243);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 97, 194, 232),
                Color.fromARGB(255, 176, 232, 243),
              ]),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 176, 232, 243),
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 15),
          ],
          color: color2,
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
                  color: color1,
                  border: Border(left: BorderSide(color: color1!)))),
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
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromARGB(255, 97, 194, 232),
                            Color.fromARGB(255, 138, 218, 234),
                          ]),
                      // color: Colors.transparent,
                      border: Border(left: BorderSide(color: color1!)))),
            )),

        // center  circle
        Positioned(
            bottom: 0,
            right: 0.25 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.25 * size)),
              // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
              child: Container(
                height: 0.5 * size,
                width: 0.5 * size,
                decoration: BoxDecoration(
                  color: color1,
                ),
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
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
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
                color: Colors.black,
                borderRadius: BorderRadius.circular(0.125 * size),
                gradient: const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromARGB(255, 16, 25, 29),
                      Color.fromARGB(255, 20, 23, 23),
                    ]),
              ),
            )),
      ]),
    );
  }
}
