import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zonne_plan/widgets/graph/GraphBar.dart';

class Graph extends StatelessWidget {
  final List<GraphBar> _previousBars = [];
  final List<GraphBar> _futureBars = [];
  final List<int> _powerCosts = [];
  final Key _currentHourKey = UniqueKey();

  Graph() {
    int _previousGraphHight = 40;
    for (int i = 0; i < 48; i++) {
      _previousGraphHight = Random().nextInt(_previousGraphHight + 20) +
          (_previousGraphHight / 4).toInt();

      _previousGraphHight > 140
          ? _previousGraphHight = 140
          : _previousGraphHight;

      _powerCosts.add(_previousGraphHight);
    }

    for (int i = -23; i < 0; i++) {
      _previousBars.add(GraphBar(
        hour: DateTime.now().add(Duration(hours: i)).hour,
        timeMachine: -1,
        barHeight: _powerCosts[i + 23],
        key: UniqueKey(),
      ));
    }

    for (int i = 1; i < 23; i++) {
      _futureBars.add(GraphBar(
        hour: DateTime.now().add(Duration(hours: i)).hour,
        timeMachine: 1,
        barHeight: _powerCosts[i + 23],
        key: UniqueKey(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 170,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ..._previousBars,
            GraphBar(
              hour: DateTime.now().hour,
              timeMachine: 0,
              barHeight: _powerCosts[23],
              key: _currentHourKey,
            ),
            ..._futureBars,
          ],
        ),
      ),
    );
  }
}
