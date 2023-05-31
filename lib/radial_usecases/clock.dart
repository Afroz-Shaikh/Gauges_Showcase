import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RadialGauge(
      needlePointer: [
        NeedlePointer(
          value: 0,
          needleStyle: NeedleStyle.flatNeedle,
          needleHeight: width / 4.5,
        ),
        NeedlePointer(
          value: 3,
          needleStyle: NeedleStyle.flatNeedle,
          needleHeight: width / 7.5,
        ),
      ],
      track: const RadialTrack(
        startAngle: 90,
        endAngle: 450,
        steps: 1,
        start: 0,
        end: 12,
      ),
    );
  }
}
