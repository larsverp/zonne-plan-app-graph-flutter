import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEDF1),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFAFCFB),
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Uurtarieven Slimme energie',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text('van 9 tot 10 uur  25ct/kWh'),
                  const SizedBox(height: 24),
                  Graph(),
                ],
              ),
            )),
      )),
    );
  }
}

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
