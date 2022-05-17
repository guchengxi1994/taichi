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
            left: 0, bottom: 0, child: BasicWidget.main(size, Colors.white)),
        Positioned(
            right: 0,
            top: 0,
            child: Transform.rotate(
              angle: math.pi,
              child: BasicWidget.main(size, Colors.white),
            )),
        Positioned(
            bottom: 0, left: 0.499 * size, child: BasicWidget.extra(size)),
        Positioned(
            top: 0,
            right: 0.499 * size,
            child: Transform.rotate(
              angle: math.pi,
              child: BasicWidget.extra(size),
            )),
      ]),
    );
  }
}
