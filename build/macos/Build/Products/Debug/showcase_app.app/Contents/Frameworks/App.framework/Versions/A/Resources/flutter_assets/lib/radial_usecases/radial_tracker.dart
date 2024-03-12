import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialTracker extends StatelessWidget {
  const RadialTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RadialGauge(
            valueBar: const [
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
                tailColor: Colors.black,
                color: Colors.red,
                needleHeight: width / 5,
                needleWidth: 10,
                tailRadius: 20,
                needleStyle: NeedleStyle.gaugeNeedle,
              ),
            ],
            track: const RadialTrack(
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
