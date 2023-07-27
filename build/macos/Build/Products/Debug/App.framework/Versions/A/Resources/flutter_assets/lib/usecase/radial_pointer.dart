import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialPointer extends StatelessWidget {
  const RadialPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "__ __",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Text("Measuring ...",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ],
          )),
          RadialGauge(
            track: RadialTrack(
                start: 0,
                end: 100,
                hideTrack: true,
                trackStyle: TrackStyle(
                    primaryRulerColor: Colors.white,
                    showPrimaryRulers: true,
                    showSecondaryRulers: false)),
            shapePointer: [
              RadialShapePointer(
                value: 30,
                shape: PointerShape.triangle,
                color: Colors.white,
              )
            ],
            valueBar: [
              RadialValueBar(
                value: 100,
                radialOffset: 40,
                gradient: LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.orangeAccent,
                  Colors.orange,
                  Colors.red,
                  Colors.purpleAccent,
                  Colors.purple
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
