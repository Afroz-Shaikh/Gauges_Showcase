import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Speedometer(),
    ),
  );
}

class Speedometer extends StatefulWidget {
  const Speedometer({Key? key}) : super(key: key);

  @override
  State<Speedometer> createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double speed = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        speed = (100 + 100 * sin(timer.tick / 10)).toDouble();
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      speed.toStringAsFixed(0),
                      style: speed > 150
                          ? const TextStyle(
                              color: Color(0xffe91717),
                              fontWeight: FontWeight.bold,
                              fontSize: 120)
                          : const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 120),
                    ),
                    const Text(
                      "KMPH",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ],
                ),
              ),
              LinearGauge(
                start: 0,
                end: 200,
                enableAnimation: true,
                valueBar: [
                  ValueBar(
                      color: speed > 150
                          ? const Color(0xffe91717)
                          : const Color.fromARGB(255, 0, 94, 226),
                      value: speed,
                      valueBarThickness: 30,
                      borderRadius: 30,
                      edgeStyle: LinearEdgeStyle.bothCurve)
                ],
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                    thickness: 30,
                    borderRadius: 30,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    linearGradient: LinearGradient(colors: [
                      Color(0xff0a3d60),
                      Color(0xff072E5f),
                      Color(0xff212161),
                      Color(0xff490a60),
                      Color(0xff630362),
                    ])),
                rulers: const RulerStyle(
                  showLabel: false,
                  showPrimaryRulers: false,
                  rulerPosition: RulerPosition.bottom,
                  showSecondaryRulers: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
