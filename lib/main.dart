import 'package:flutter/material.dart';
import 'package:zonne_plan/widgets/graph/Graph.dart';

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
