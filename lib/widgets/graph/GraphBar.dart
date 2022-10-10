import 'dart:math';

import 'package:flutter/material.dart';

class GraphBar extends StatefulWidget {
  int hour;
  int barHeight;
  int timeMachine;

  GraphBar({
    Key? key,
    required this.hour,
    required this.timeMachine,
    required this.barHeight,
  }) : super(key: key);

  @override
  State<GraphBar> createState() => _GraphBarState();
}

class _GraphBarState extends State<GraphBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Container(
            width: 9,
            height: widget.barHeight.toDouble(),
            decoration: BoxDecoration(
              color: widget.barHeight > 40 && widget.barHeight < 80
                  ? widget.timeMachine < 0
                      ? const Color(0xFF365651).withOpacity(0.2)
                      : const Color(0xFF365651)
                  : widget.barHeight > 70
                      ? widget.timeMachine < 0
                          ? const Color(0xFFEE5D1A).withOpacity(0.2)
                          : const Color(0xFFEE5D1A)
                      : widget.timeMachine < 0
                          ? const Color(0xFF00A963).withOpacity(0.2)
                          : const Color(0xFF00A963),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          widget.timeMachine == 0
              ? Text(
                  'nu',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                )
              : Text(
                  widget.hour.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                  ),
                )
        ],
      ),
    );
  }
}
