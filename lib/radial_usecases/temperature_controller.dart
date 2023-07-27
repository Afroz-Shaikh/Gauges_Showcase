import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class TemperatureController extends StatefulWidget {
  const TemperatureController({super.key});

  @override
  State<TemperatureController> createState() => _TemperatureControllerState();
}

class _TemperatureControllerState extends State<TemperatureController> {
  double value = 10;
  double value2 = 30;
  double value3 = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: 300,
              backgroundColor: const Color.fromARGB(255, 24, 24, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${value2.round().toString()}°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 135,
                      color: getColor(),
                    ),
                  ),
                  const Text(
                    "Temp in °C",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: RadialGauge(
              radiusFactor: 0.9,
              track: RadialTrack(
                startAngle: 0,
                endAngle: 360,
                hideTrack: false,
                thickness: 50,
                color: const Color(0xff282828),
                start: 0,
                trackStyle: TrackStyle(
                    showFirstLabel: false,
                    showLastLabel: true,
                    showLabel: false,
                    secondaryRulerPerInterval: 10,
                    primaryRulerColor: getColor(),
                    primaryRulersHeight: 20,
                    secondaryRulersHeight: 20,
                    primaryRulersWidth: 2,
                    secondaryRulersWidth: 2,
                    rulersOffset: -60,
                    // primaryRulersWidth: 5,
                    secondaryRulerColor: getColor()),
                end: 100,
              ),
              shapePointer: [
                RadialShapePointer(
                  value: value2,
                  isInteractive: true,
                  color: Colors.white,
                  width: 14,
                  onChanged: (value) async {
                    setState(() {
                      value2 = value;
                    });
                  },
                ),
                // RadialShapePointer(
                //   isInteractive: true,
                //   shape: PointerShape.circle,
                //   color: Colors.black,
                //   onChanged: (value) {
                //     setState(() {
                //       this.value = value;
                //     });
                //   },
                //   value: value,
                // )
              ],
              valueBar: const [
                RadialValueBar(
                  value: 200,
                  valueBarThickness: 30,
                  gradient: LinearGradient(colors: [
                    Color(0xff212121),
                    Color(0xff212121),
                    Color(0xff212121)
                  ]),
                  radialOffset: -55,

                  color: Color(0xff424443),

                  // valueBarThickness: 100,
                ),
              ],
              // needlePointer: [
              //   NeedlePointer(
              //     value: value,
              //     isInteractive: true,
              //     onChanged: (value) {
              //       setState(() {
              //         this.value = value;
              //       });
              //     },
              //   )
              // ],
            ),
          ),
        ],
      ),
    );
  }

  getColor() {
    if (value2 < 20) {
      return Colors.blueAccent;
    } else if (value2 < 40) {
      return Colors.blue;
    } else if (value2 < 60) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
