/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-24 19:55:00
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-24 20:58:03
 */
part of './taichi.dart';

class _SimpleTaichiAutoRotateWidget extends StatefulWidget {
  const _SimpleTaichiAutoRotateWidget(
      {Key? key, required this.size, required this.fps})
      : super(key: key);

  final double size;
  final int fps;

  @override
  State<_SimpleTaichiAutoRotateWidget> createState() =>
      __SimpleTaichiAutoRotateWidgetState();
}

class __SimpleTaichiAutoRotateWidgetState
    extends State<_SimpleTaichiAutoRotateWidget> {
  late Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _timer = Timer.periodic(
          Duration(milliseconds: (1000 / widget.fps).round()), (timer) {
        context.read<TaichiGraphRotateController>().addAngle();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: context.watch<TaichiGraphRotateController>().angle,
      child: TaichiGraph.simple(size: widget.size),
    );
  }
}
