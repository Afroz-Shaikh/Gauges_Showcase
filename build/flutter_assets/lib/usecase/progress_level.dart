import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(const MaterialApp(
    home: ProgressLevel(),
  ));
}

class ProgressLevel extends StatelessWidget {
  const ProgressLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearGauge(
            pointers: const [
              Pointer(
                  width: 50,
                  value: 75,
                  shape: PointerShape.circle,
                  color: Colors.teal),
            ],
            rulers: const RulerStyle(
              rulerPosition: RulerPosition.center,
              showLabel: false,
            ),
            linearGaugeBoxDecoration:
                const LinearGaugeBoxDecoration(thickness: 30),
            rangeLinearGauge: [
              RangeLinearGauge(color: Colors.red, start: 0, end: 10),
              RangeLinearGauge(color: Colors.deepOrange, start: 10, end: 20),
              RangeLinearGauge(color: Colors.orange, start: 20, end: 30),
              RangeLinearGauge(color: Colors.amber, start: 30, end: 40),
              RangeLinearGauge(color: Colors.yellow, start: 40, end: 50),
              RangeLinearGauge(color: Colors.lime, start: 50, end: 60),
              RangeLinearGauge(color: Colors.lightGreen, start: 60, end: 70),
              RangeLinearGauge(color: Colors.green, start: 70, end: 80),
              RangeLinearGauge(color: Colors.teal, start: 80, end: 90),
              RangeLinearGauge(color: Colors.cyan, start: 90, end: 100),
            ],
          ),
        ],
      ),
    );
  }
}

//