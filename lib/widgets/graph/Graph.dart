import 'package:flutter/material.dart';
import 'package:zonne_plan/widgets/graph/GraphBar.dart';

class Graph extends StatelessWidget {
  final List<GraphBar> _previousBars = [];
  final List<GraphBar> _futureBars = [];
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 380.0,
    keepScrollOffset: true,
  );

  Graph() {
    for (int i = -23; i < 0; i++) {
      _previousBars.add(GraphBar(
        hour: DateTime.now().add(Duration(hours: i)).hour,
        timeMachine: -1,
      ));
    }

    for (int i = 1; i < 23; i++) {
      _futureBars.add(GraphBar(
        hour: DateTime.now().add(Duration(hours: i)).hour,
        timeMachine: 1,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          SizedBox(
            width: 80,
          ),
          Container(
            width: 1,
            height: 112,
            color: const Color(0xFFB1B6BE),
          ),
        ],
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ..._previousBars,
            GraphBar(
              hour: DateTime.now().hour,
              timeMachine: 0,
            ),
            ..._futureBars,
          ],
        ),
      ),
    ]);
  }
}
