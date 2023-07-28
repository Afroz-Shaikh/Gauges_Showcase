import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialTracker extends StatelessWidget {
  const RadialTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RadialGauge(
            valueBar: [
              RadialValueBar(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.amber,
                  Colors.yellow,
                  Colors.green,
                  Colors.lightGreen
                ]),
                value: 100,
                valueBarThickness: 40,
              ),
            ],
            needlePointer: [
              NeedlePointer(
                value: 40,
                tailColor: Colors.red,
                color: Colors.red,
              ),
            ],
            track: RadialTrack(
              steps: 10,
              hideTrack: false,
              trackStyle: TrackStyle(
                showPrimaryRulers: true,
                showSecondaryRulers: false,
              ),
              start: 0,
              thickness: 20,
              end: 100,
            ),
          ),
        ),
      ],
    );
  }
}
