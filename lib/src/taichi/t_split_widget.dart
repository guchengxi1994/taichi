/// extra taichi graph

part of "./taichi.dart";

@Unfinished()
class _SplitedTaichi extends StatelessWidget {
  const _SplitedTaichi(
      {Key? key,
      this.color = Colors.blue,
      this.size = 300,
      this.gradient = false})
      : assert(size > 0),
        super(key: key);

  final Color color;
  final double size;
  final bool gradient;

  @override
  Widget build(BuildContext context) {
    debugPrint(const Unfinished().toString());
    List<Color> colors = [];

    colors.add(color);

    if (gradient) {
      int r = color.red + 50 > 255 ? color.red - 50 : color.red + 50;
      int g = color.green + 50 > 255 ? color.green - 50 : color.green + 50;
      int b = color.blue + 50 > 255 ? color.blue - 50 : color.blue + 50;
      colors.add(Color.fromARGB(color.alpha, r, g, b));
    }

    return Container(
      color: Colors.transparent,
      width: 1.15 * size,
      height: 1 * size,
      child: Stack(children: [
        Positioned(
            left: 0, bottom: 0, child: _BasicWidget.main(size, Colors.white)),
        Positioned(
            right: 0,
            top: 0,
            child: Transform.rotate(
              angle: math.pi,
              child: _BasicWidget.main(size, Colors.white),
            )),
        Positioned(
            bottom: 0, left: 0.499 * size, child: _BasicWidget.extra(size)),
        Positioned(
            top: 0,
            right: 0.499 * size,
            child: Transform.rotate(
              angle: math.pi,
              child: _BasicWidget.extra(size),
            )),
      ]),
    );
  }
}

class _BasicWidget {
  static Widget main(double size, Color backgroundColor,
      {Color mainColor = Colors.blue}) {
    return Container(
        height: size,
        width: 0.75 * size,
        color: Colors.transparent,
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
