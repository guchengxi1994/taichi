part of 'taichi.dart';

/// a simple taichi sample
class _TaichiStatelessWidget extends StatelessWidget {
  const _TaichiStatelessWidget({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.5 * size),
          border: Border.all(color: Colors.black)),
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
              decoration: const BoxDecoration(
                  color: Colors.black,
                  border: Border(left: BorderSide(color: Colors.black)))),
        )),

        // center white circle
        Positioned(
            top: 0,
            left: 0.25 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.25 * size)),
              // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
              child: Container(
                  height: 0.5 * size,
                  width: 0.5 * size,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  )),
            )),

        // center black circle
        Positioned(
            bottom: 0,
            right: 0.25 * size,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.25 * size)),
              // BorderRadius.only(bottomLeft: Radius.circular(0.25 * size)),
              child: Container(
                height: 0.5 * size,
                width: 0.5 * size,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            )),

        // small black dot

        Positioned(
            top: 0.125 * size * 1.5,
            left: 0.5 * size - 0.125 * 0.5 * size,
            height: 0.125 * size,
            width: 0.125 * size,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(0.125 * size),
              ),
            )),

        // small white dot
        Positioned(
            bottom: 0.125 * 1.5 * size,
            left: 0.5 * size - 0.125 * 0.5 * size,
            height: 0.125 * size,
            width: 0.125 * size,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.125 * size),
              ),
            )),
      ]),
    );
  }
}
