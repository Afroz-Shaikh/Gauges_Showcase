import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class BikeSpeedometer extends StatefulWidget {
  const BikeSpeedometer({super.key});

  @override
  State<BikeSpeedometer> createState() => _BikeSpeedometerState();
}

class _BikeSpeedometerState extends State<BikeSpeedometer> {
  double value = 30;
  double value2 = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value2.round().toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const Text("Speed in km/h")
              ],
            ),
          ),
          Center(
            child: SizedBox(
              // height: 500,
              // width: 400,
              child: RadialGauge(
                radiusFactor: 0.8,
                track: const RadialTrack(
                  hideTrack: false,
                  thickness: 20,
                  color: Colors.black,
                  start: 0,
                  trackStyle: TrackStyle(
                      showLabel: true,
                      secondaryRulerPerInterval: 4,
                      primaryRulerColor: Colors.red,
                      primaryRulersHeight: 5,
                      primaryRulersWidth: 5,
                      secondaryRulerColor: Colors.red),
                  end: 100,
                  // startAngle: 0,
                  // endAngle: 360,
                ),
                shapePointer: [
                  RadialShapePointer(
                    value: value2,
                    isInteractive: true,
                    width: 20,
                    onChanged: (value) {
                      setState(() {
                        value2 = value;
                      });
                    },
                  ),
                ],
                valueBar: [
                  RadialValueBar(
                    value: value2,

                    color: Colors.red,

                    // valueBarThickness: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
