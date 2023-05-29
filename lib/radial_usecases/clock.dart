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
          // tailRadius: 100,
          needleHeight: width / 4.5,
        ),
      ],
      track: const RadialTrack(
        startAngle: 270,
        steps: 1,
        endAngle: 630,
        start: 0,
        end: 12,
      ),
    );
  }
}
