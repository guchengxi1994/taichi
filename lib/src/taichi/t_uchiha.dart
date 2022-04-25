part of './taichi.dart';

class _Uchiha extends StatelessWidget {
  const _Uchiha({Key? key, this.color = Colors.blue, this.size = 100})
      : super(key: key);

  final Color color;
  final double size;

  final double factor = 0.45;

  Widget baseWidget(double size) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned(
              left: 0, bottom: 0, child: BasicWidget.main(size, Colors.white)),
          Positioned(
              bottom: 0, left: 0.495 * size, child: BasicWidget.extra(size)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: size,
      height: size,
      child: Stack(children: [
        Positioned(
          top: 0.5 * size - factor * size,
          left: 0.5 * size - 0.5 * factor * size,
          child: Transform.rotate(
            angle: math.pi / 3,
            child: baseWidget(size * factor),
          ),
        ),
        Positioned(
          top: 0.5 * size,
          left: 0.5 * size - factor * size,
          child: Transform.rotate(
            angle: math.pi / 3 * 4.2,
            child: baseWidget(size * factor),
          ),
        ),
        Positioned(
          top: 0.5 * size - factor * size,
          left: 0.5 * size - 0.5 * factor * size,
          child: Transform.rotate(
            origin: Offset(size * 0.25 * factor, size * 0.5 * factor),
            angle: math.pi,
            child: baseWidget(size * factor),
          ),
        ),
      ]),
    );
  }
}
