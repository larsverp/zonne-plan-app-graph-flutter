import 'dart:math';

import 'package:flutter/material.dart';

class GraphBar extends StatelessWidget {
  int hour;
  int barHeight = 15 + Random().nextInt(100);

  int timeMachine;

  GraphBar({
    required this.hour,
    required this.timeMachine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Container(
            width: 9,
            height: barHeight.toDouble(),
            decoration: BoxDecoration(
              color: barHeight > 40 && barHeight < 80
                  ? timeMachine < 0
                      ? const Color(0xFF365651).withOpacity(0.2)
                      : const Color(0xFF365651)
                  : barHeight > 70
                      ? timeMachine < 0
                          ? const Color(0xFFEE5D1A).withOpacity(0.2)
                          : const Color(0xFFEE5D1A)
                      : timeMachine < 0
                          ? const Color(0xFF00A963).withOpacity(0.2)
                          : const Color(0xFF00A963),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          timeMachine == 0
              ? Text(
                  'nu',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                )
              : Text(
                  hour.toString(),
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
