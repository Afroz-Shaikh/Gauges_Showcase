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
            needleStyle: NeedleStyle.flatNeedle,
            needleHeight: width / 4.5,
          ),
          NeedlePointer(
            value: 13,
            color: Colors.grey,
            needleStyle: NeedleStyle.flatNeedle,
            needleHeight: width / 7.5,
          ),
        ],
        track: const RadialTrack(
          hideTrack: true,
          startAngle: 90,
          endAngle: 450,
          steps: 1,
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
