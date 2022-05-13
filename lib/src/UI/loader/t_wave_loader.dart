part of './loader.dart';

/// make some changes from
/// https://github.com/mitesh77/Best-Flutter-UI-Templates
class _WaveAnimationView extends StatefulWidget {
  final double percentageValue;
  final double height;
  final double width;
  final Color frontColor;
  final Color backColor;

  const _WaveAnimationView(
      {Key? key,
      this.percentageValue = 100.0,
      this.height = 160,
      this.width = 60,
      this.frontColor = LoaderTheme.nearlyDarkBlue,
      this.backColor = Colors.blue})
      : super(key: key);
  @override
  State<_WaveAnimationView> createState() => _WaveAnimationViewState();
}

class _WaveAnimationViewState extends State<_WaveAnimationView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? waveAnimationController;
  // ignore: prefer_const_constructors
  Offset bottleOffset1 = Offset(0, 0);
  List<Offset> animList1 = [];
  late Offset bottleOffset2 = Offset(widget.width, 0);
  List<Offset> animList2 = [];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    waveAnimationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController?.forward();
      }
    });
    waveAnimationController!.addListener(() {
      animList1.clear();
      for (int i = -2 - bottleOffset1.dx.toInt(); i <= widget.width + 2; i++) {
        animList1.add(
          Offset(
            i.toDouble() + bottleOffset1.dx.toInt(),
            math.sin((waveAnimationController!.value * 360 - i) %
                        360 *
                        vector.degrees2Radians) *
                    4 +
                (((100 - widget.percentageValue) * widget.height / 100)),
          ),
        );
      }
      animList2.clear();
      for (int i = -2 - bottleOffset2.dx.toInt(); i <= widget.width + 2; i++) {
        animList2.add(
          Offset(
            i.toDouble() + bottleOffset2.dx.toInt(),
            math.sin((waveAnimationController!.value * 360 - i) %
                        360 *
                        vector.degrees2Radians) *
                    4 +
                (((100 - widget.percentageValue) * widget.height / 100)),
          ),
        );
      }
    });
    waveAnimationController?.repeat();
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    waveAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: animationController!,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.frontColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                      topRight: Radius.circular(80)),
                  gradient: LinearGradient(
                    colors: [
                      widget.frontColor.withOpacity(0.2),
                      widget.frontColor.withOpacity(0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              clipper: WaveClipper(animationController!.value, animList1),
            ),
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.frontColor,
                  gradient: LinearGradient(
                    colors: [
                      widget.frontColor.withOpacity(0.4),
                      widget.frontColor
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      bottomLeft: Radius.circular(80.0),
                      bottomRight: Radius.circular(80.0),
                      topRight: Radius.circular(80.0)),
                ),
              ),
              clipper: WaveClipper(animationController!.value, animList2),
            ),
            SizedBox(
              // padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.percentageValue.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: LoaderTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: (24.0).autoFontSize(widget.width),
                        letterSpacing: 0.0,
                        color: LoaderTheme.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: (3.0).autoFontSize(widget.width)),
                      child: Text(
                        '%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: LoaderTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: (14.0).autoFontSize(widget.width),
                          letterSpacing: 0.0,
                          color: LoaderTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 6,
              bottom: 8,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController!,
                    curve:
                        const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: LoaderTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 0,
              bottom: 16,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController!,
                    curve:
                        const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: LoaderTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 24,
              bottom: 32,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController!,
                    curve:
                        const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: LoaderTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              bottom: 0,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 16 * (1.0 - animationController!.value), 0.0),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: LoaderTheme.white.withOpacity(
                        animationController!.status == AnimationStatus.reverse
                            ? 0.0
                            : 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}

class _WaveView extends StatefulWidget {
  const _WaveView(
      {Key? key,
      this.width = 80,
      this.height = 160,
      this.frontColor = LoaderTheme.nearlyDarkBlue,
      this.backColor = Colors.blue,
      this.duration,
      this.percentageValue})
      : super(key: key);

  final double width;
  final double height;
  final Color frontColor;
  final Color backColor;
  final double? duration;
  final double? percentageValue;

  @override
  State<_WaveView> createState() => _WaveViewState();
}

class _WaveViewState extends State<_WaveView> {
  late double width = widget.width;
  late double height = widget.height;
  late Color frontColor = widget.frontColor;
  late Color backColor = widget.backColor;
  late double? duration = widget.duration;
  late double? percentageValue = widget.percentageValue;

  late Timer? timer;

  @override
  void dispose() {
    if (duration != null) {
      timer?.cancel();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (duration != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        timer = Timer.periodic(
            Duration(
                milliseconds: (duration! / (100 - percentageValue!) * 1000)
                    .round()), (timer) {
          context.read<ProcessLoaderController>().changeValue(step: 1);

          if (context.read<ProcessLoaderController>().canFinish) {
            debugPrint("timer cancelling");
            timer.cancel();
            debugPrint("timer canceled");
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    if (duration == null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80.0),
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(80.0),
              topRight: Radius.circular(80.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(2, 2),
                blurRadius: 4),
          ],
        ),
        child: _WaveAnimationView(
          percentageValue: percentageValue ?? 0,
          height: height,
          width: width,
          frontColor: frontColor,
          backColor: backColor,
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80.0),
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(80.0),
              topRight: Radius.circular(80.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(2, 2),
                blurRadius: 4),
          ],
        ),
        child: _WaveAnimationView(
          percentageValue: context.watch<ProcessLoaderController>().value,
          height: height,
          width: width,
          frontColor: frontColor,
          backColor: backColor,
        ),
      );
    }
  }
}
