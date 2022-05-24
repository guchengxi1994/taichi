import 'package:flutter/material.dart';
import 'package:taichi/src/utils/taichi_utils.dart';

enum BoxStatus { done, delayed, nothing, cannotSelected, underGoing }

// ignore: must_be_immutable
class DayBox extends StatefulWidget {
  DayBox(
      {Key? key,
      required this.year,
      required this.rowId,
      required this.columnId,
      this.boxStatus,
      required this.isWeekend,
      this.onDoubleTap})
      : super(key: key);
  int rowId;
  int columnId;
  BoxStatus? boxStatus;
  bool isWeekend;
  int year;
  // ignore: prefer_typing_uninitialized_variables
  final onDoubleTap;

  @override
  State<DayBox> createState() => _DayBoxState();
}

class _DayBoxState extends State<DayBox> {
  late Color backgroundColor;
  String tootipMessage = "";
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.boxStatus == BoxStatus.nothing) {
      backgroundColor = Colors.white;
    } else if (widget.boxStatus == BoxStatus.delayed) {
      backgroundColor = Colors.red;
    } else if (widget.boxStatus == BoxStatus.done) {
      backgroundColor = Colors.green;
    } else if (widget.boxStatus == BoxStatus.underGoing) {
      backgroundColor = const Color.fromARGB(255, 28, 103, 189);
    } else {
      backgroundColor = Colors.yellow;
    }

    tootipMessage = widget.isWeekend
        ? "${widget.rowId}月${widget.columnId}日 周末"
        : "${widget.rowId}月${widget.columnId}日";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: widget.isWeekend
              ? Border.all(
                  color: const Color.fromARGB(255, 47, 98, 133),
                  width: isSelected ? 2 : 1)
              : Border.all(color: Colors.grey[500]!, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(5)),
      child: !TaichiDevUtils.isWeb
          ? Tooltip(
              message: widget.boxStatus != BoxStatus.cannotSelected
                  ? tootipMessage
                  : "",
              child: InkWell(
                onTap: widget.boxStatus == BoxStatus.cannotSelected
                    ? null
                    : () {
                        // debugPrint(tootipMessage);
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                onDoubleTap: widget.onDoubleTap,
              ),
            )
          : InkWell(
              onTap: widget.boxStatus == BoxStatus.cannotSelected
                  ? null
                  : () {
                      // debugPrint(tootipMessage);
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
              onDoubleTap: widget.onDoubleTap,
            ),
    );
  }
}
