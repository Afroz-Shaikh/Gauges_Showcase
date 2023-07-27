import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialStepCounter extends StatelessWidget {
  const RadialStepCounter({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double shortSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.1),
            maxRadius: shortSide / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Steps",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "4883",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const Text("Goal : 5000"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Connect Watch⌚️"),
                ),
              ],
            ),
          )),
          const RadialGauge(
            // radiusFactor: 0.9,
            valueBar: [
              RadialValueBar(
                gradient: LinearGradient(colors: [
                  Colors.lightGreenAccent,
                  Colors.lightGreen,
                  Colors.greenAccent,
                  Colors.green,
                ]),
                value: 80,
                // radialOffset: 38,
              )
            ],
            track: RadialTrack(
                start: 0,
                end: 100,
                color: Colors.grey,
                trackStyle: TrackStyle(
                  showPrimaryRulers: false,
                  showLabel: false,
                  showSecondaryRulers: false,
                )),
          ),
        ],
      ),
    );
  }
}
