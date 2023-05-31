import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class SpeedTest extends StatelessWidget {
  const SpeedTest({super.key});

  @override
  Widget build(BuildContext context) {
    double value = 80;
    return Container(
      color: Colors.white,
      child: RadialGauge(
        valueBar: [
          RadialValueBar(
            value: value,
            valueBarThickness: 30,
            gradient: const LinearGradient(colors: [Colors.blue, Colors.green]),
          )
        ],
        needlePointer: [
          NeedlePointer(
            value: value,
            needleHeight: 200,
            needleWidth: 20,
            needleStyle: NeedleStyle.flatNeedle,
            tailColor: Colors.transparent,
            gradient: const LinearGradient(
                colors: [Colors.transparent, Colors.black]),
          ),
        ],
        track: RadialTrack(
          thickness: 30,
          steps: 10,
          trackStyle: const TrackStyle(
              showPrimaryRulers: false, showSecondaryRulers: false),
          color: Colors.black.withOpacity(0.2),
          hideTrack: false,
          start: 0,
          end: 100,
        ),
      ),
    );
  }
}
