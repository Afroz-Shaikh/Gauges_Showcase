import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class AirPurifier extends StatefulWidget {
  const AirPurifier({super.key});

  @override
  State<AirPurifier> createState() => _AirPurifierState();
}

class _AirPurifierState extends State<AirPurifier> {
  double value = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (value < 50) {
                        value = value + 1;
                      } else {
                        value = 50;
                      }
                    });
                  },
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("${value.round()} °C",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (value > 0) {
                        value = value - 1;
                      } else {
                        value = 0;
                      }
                    });
                  },
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          RadialGauge(
            radiusFactor: 0.9,
            shapePointer: [
              RadialShapePointer(
                value: value,
                isInteractive: true,
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                color: Colors.white,
                width: 20,
              )
            ],
            valueBar: [
              RadialValueBar(
                value: value,
                valueBarThickness: 30,
                gradient: const LinearGradient(colors: [
                  Colors.red,
                  Colors.redAccent,
                  Colors.blue,
                  Colors.blueAccent
                ]),
              )
            ],
            track: RadialTrack(
              start: 0,
              end: 50,
              startAngle: 90,
              endAngle: 450,
              hideLabels: true,
              hideTrack: false,
              thickness: 30,
              color: Colors.white.withOpacity(0.3),
              trackStyle: const TrackStyle(
                showLabel: false,
                showSecondaryRulers: false,
                showPrimaryRulers: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
