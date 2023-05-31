import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialTracker extends StatelessWidget {
  const RadialTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Container(
            // color: Colors.red,
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height / 1.4,
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
                  needleHeight: MediaQuery.of(context).size.width / 7,
                  tailColor: Colors.red,
                  color: Colors.red,
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
        ),
      ],
    );
  }
}
