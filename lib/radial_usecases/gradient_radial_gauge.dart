import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialExample extends StatelessWidget {
  const RadialExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const RadialGauge(
      needlePointer: [
        NeedlePointer(
          value: 10,
          needleHeight: 200,
          needleWidth: 10,
          tailColor: Colors.transparent,
          gradient: LinearGradient(colors: [Colors.green, Colors.blue]),
        ),
      ],
      track: RadialTrack(
        thickness: 30,
        steps: 10,
        hideTrack: false,
        gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
        start: 0,
        end: 100,
      ),
    );
  }
}


//* Example 1 - Clocl 
//  RadialTrack(
//         startAngle: 0,
//         endAngle: 360,
//         hideTrack: true,
//         start: 0,
//         end: 12,
//       ),