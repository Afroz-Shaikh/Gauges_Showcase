import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class FancyClock extends StatelessWidget {
  const FancyClock({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RadialGauge(
        radiusFactor: 0.9,
        needlePointer: [
          NeedlePointer(
            value: 10,
            needleWidth: 10,
            tailColor: Colors.red,
            tailRadius: 20,
            needleStyle: NeedleStyle.flatNeedle,
            needleHeight: width / 5.5,
          ),
          NeedlePointer(
            value: 13,
            color: Colors.black,
            needleWidth: 10,
            tailColor: Colors.black,
            tailRadius: 20,
            needleStyle: NeedleStyle.flatNeedle,
            needleHeight: width / 7.5,
          ),
        ],
        track: RadialTrack(
          hideTrack: false,
          color: Colors.red.withOpacity(0.02),
          startAngle: 90,
          endAngle: 450,
          steps: 1,
          trackStyle: const TrackStyle(
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              showLastLabel: false,
              primaryRulerColor: Colors.red,
              primaryRulersWidth: 3,
              secondaryRulerColor: Colors.black,
              secondaryRulersWidth: 2),
          start: 0,
          end: 12,
        ));
  }
}
