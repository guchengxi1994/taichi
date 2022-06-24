// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';

enum HowToolTipShow { onMouseHover, onTap }

enum Corner { leftTop, rightTop, leftBottom, rightBottom }

class CustomTooltip extends StatefulWidget {
  CustomTooltip(
      {Key? key,
      required this.child,
      required this.tooltip,
      this.howToolTipShow = HowToolTipShow.onTap,
      this.targetAnchor = Alignment.topCenter,
      this.followerAnchor = Alignment.bottomCenter,
      this.tooltipHeight = 300,
      this.tooltipBackgroundColor = Colors.white,
      this.tooltipBorderColor = const Color.fromARGB(255, 159, 151, 151),
      this.tooltipIndicatorToRight = 20,
      this.tooltipIndicatorSize = 20,
      this.corner = Corner.rightTop})
      : super(key: key);
  Widget child;
  Widget tooltip;
  HowToolTipShow howToolTipShow;
  Alignment targetAnchor;
  Alignment followerAnchor;
  double tooltipHeight;
  final Corner corner;
  final Color tooltipBorderColor;
  final Color tooltipBackgroundColor;
  final double tooltipIndicatorToRight;
  final double tooltipIndicatorSize;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  final LayerLink layerLink = LayerLink();
  final GlobalKey key = GlobalKey();

  late double childHeight = 0;
  bool show = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      childHeight = key.currentContext!.size!.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.howToolTipShow == HowToolTipShow.onTap) {
      return CompositedTransformTarget(
        link: layerLink,
        child: InkWell(
          key: key,
          onTap: () {
            if (!show) {
              _overlayEntry = OverlayEntry(builder: (c) {
                return UnconstrainedBox(
                  child: CompositedTransformFollower(
                    link: layerLink,
                    followerAnchor: widget.followerAnchor,
                    targetAnchor: widget.targetAnchor,
                    offset: Offset(0, widget.tooltipHeight + childHeight),
                    child: SizedBox(
                        height: widget.tooltipHeight,
                        child: _TooltipWrapper(
                          size: widget.tooltipIndicatorSize,
                          borderColor: widget.tooltipBorderColor,
                          backgroundColor: widget.tooltipBackgroundColor,
                          toCorner: widget.tooltipIndicatorToRight,
                          child: widget.tooltip,
                        )),
                  ),
                );
              });

              OverlayState? overlayState = Navigator.of(context).overlay;
              overlayState?.insert(_overlayEntry!);
            } else {
              try {
                _overlayEntry?.remove();
              } catch (_) {}
            }
            show = !show;
          },
          child: Material(
            color: Colors.white,
            child: widget.child,
          ),
        ),
      );
    }
    return CompositedTransformTarget(
      link: layerLink,
      child: MouseRegion(
        key: key,
        onEnter: (event) {
          _overlayEntry = OverlayEntry(builder: (c) {
            return UnconstrainedBox(
              child: CompositedTransformFollower(
                link: layerLink,
                followerAnchor: widget.followerAnchor,
                targetAnchor: widget.targetAnchor,
                offset: Offset(0, widget.tooltipHeight + childHeight),
                child: SizedBox(
                    height: widget.tooltipHeight,
                    child: _TooltipWrapper(
                      size: widget.tooltipIndicatorSize,
                      borderColor: widget.tooltipBorderColor,
                      backgroundColor: widget.tooltipBackgroundColor,
                      toCorner: widget.tooltipIndicatorToRight,
                      child: widget.tooltip,
                    )),
              ),
            );
          });

          OverlayState? overlayState = Navigator.of(context).overlay;
          overlayState?.insert(_overlayEntry!);
        },
        onExit: (event) {
          try {
            _overlayEntry?.remove();
          } catch (_) {}
        },
        child: Material(
          color: Colors.white,
          child: widget.child,
        ),
      ),
    );
  }
}

class _TooltipWrapper extends StatelessWidget {
  const _TooltipWrapper(
      {Key? key,
      required this.child,
      this.size = 20,
      this.borderColor = const Color.fromARGB(255, 159, 151, 151),
      this.backgroundColor = Colors.white,
      this.toCorner = 20})
      : super(key: key);
  final Widget child;
  final double size;
  final Color borderColor;
  final Color backgroundColor;
  final double toCorner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular((15.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10, //阴影范围
                  spreadRadius: 0.1, //阴影浓度
                  color: Colors.grey.withOpacity(0.2), //阴影颜色
                ),
              ],
              border: Border.all(
                color: borderColor,
                width: 0.5,
              )),
          margin: EdgeInsets.only(top: size * 0.5),
          child: child,
        ),
        Positioned(
          right: toCorner,
          top: 0,
          child: Transform.rotate(
              angle: 3.1415 / 4,
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border(
                      top: BorderSide(
                        color: borderColor,
                        width: 0.5,
                      ),
                      left: BorderSide(
                        color: borderColor,
                        width: 0.5,
                      ),
                    )),
                width: size,
                height: size,
              )),
        )
      ],
    );
  }
}
