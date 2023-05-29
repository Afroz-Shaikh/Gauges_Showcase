import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class SimpleGauge extends StatelessWidget {
  const SimpleGauge({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RadialGauge(
        needlePointer: [
          NeedlePointer(
            value: 0,
            needleHeight: width / 4.5,
          ),
        ],
        track: const RadialTrack(
          start: 0,
          end: 100,
        ));
  }
}
