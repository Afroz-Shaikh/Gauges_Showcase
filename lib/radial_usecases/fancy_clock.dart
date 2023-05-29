import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class FancyClock extends StatelessWidget {
  const FancyClock({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RadialGauge(
        needlePointer: [
          NeedlePointer(
            value: 10,
            tailColor: Colors.green,
            needleHeight: width / 4.5,
          ),
        ],
        track: const RadialTrack(
          hideTrack: true,
          startAngle: 270,
          steps: 1,
          endAngle: 630,
          trackStyle: TrackStyle(
              primaryRulerColor: Colors.red,
              primaryRulersWidth: 3,
              secondaryRulerColor: Colors.black,
              secondaryRulersWidth: 2),
          start: 0,
          end: 12,
        ));
  }
}
