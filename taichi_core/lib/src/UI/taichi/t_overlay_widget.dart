// ignore_for_file: unused_element

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-24 19:14:07
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-24 21:10:22
 */

part of './taichi.dart';

/// inspired by https://github.com/java-james/loading_overlay/blob/master/lib/loading_overlay.dart
class _SimpleTaichiLoadingOverlay extends StatefulWidget {
  const _SimpleTaichiLoadingOverlay(
      {Key? key,
      required this.isLoading,
      required this.child,
      this.opacity = 0.5,
      this.color,
      this.size = 100})
      : super(key: key);
  final bool isLoading;
  final double opacity;
  final Color? color;
  final double size;
  final Widget child;

  @override
  State<_SimpleTaichiLoadingOverlay> createState() =>
      __SimpleTaichiLoadingOverlayState();
}

class __SimpleTaichiLoadingOverlayState
    extends State<_SimpleTaichiLoadingOverlay>
    with SingleTickerProviderStateMixin {
  late Widget loadingWidget = TaichiAutoRotateGraph.simple(size: widget.size);

  late AnimationController _controller;
  late Animation<double> _animation;
  bool? _overlayVisible;

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      // ignore: unnecessary_statements
      status == AnimationStatus.forward
          ? setState(() => {_overlayVisible = true})
          : null;
      // ignore: unnecessary_statements
      status == AnimationStatus.dismissed
          ? setState(() => {_overlayVisible = false})
          : null;
    });
    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(_SimpleTaichiLoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: widget.opacity,
              child: ModalBarrier(
                dismissible: false,
                color: widget.color ?? Theme.of(context).colorScheme.background,
              ),
            ),
            Center(child: loadingWidget),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }
}

// ignore: must_be_immutable
class _CustomTaichiLoadingOverlay extends StatefulWidget {
  _CustomTaichiLoadingOverlay(
      {Key? key,
      required this.isLoading,
      required this.child,
      required this.loadingWidget,
      this.opacity = 0.5,
      this.color,
      this.size = 100,
      this.left,
      this.top,
      this.right,
      this.bottom})
      : assert(left == null || right == null),
        assert(top == null || bottom == null),
        super(key: key);

  final bool isLoading;
  final double opacity;
  final Color? color;
  final double size;
  final Widget child;
  final Widget loadingWidget;
  double? left;
  double? right;
  double? top;
  double? bottom;

  @override
  State<_CustomTaichiLoadingOverlay> createState() =>
      __CustomTaichiLoadingOverlayState();
}

class __CustomTaichiLoadingOverlayState
    extends State<_CustomTaichiLoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool? _overlayVisible;

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      // ignore: unnecessary_statements
      status == AnimationStatus.forward
          ? setState(() => {_overlayVisible = true})
          : null;
      // ignore: unnecessary_statements
      status == AnimationStatus.dismissed
          ? setState(() => {_overlayVisible = false})
          : null;
    });
    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(_CustomTaichiLoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: widget.opacity,
              child: ModalBarrier(
                dismissible: false,
                color: widget.color ?? Theme.of(context).colorScheme.background,
              ),
            ),
            Positioned(
              left: widget.left,
              right: widget.right,
              top: widget.top,
              bottom: widget.bottom,
              child: widget.loadingWidget,
            ),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }
}
