import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class ValueSlider extends StatefulWidget {
  const ValueSlider({super.key});

  @override
  State<ValueSlider> createState() => _ValueSliderState();
}

class _ValueSliderState extends State<ValueSlider> {
  double value2 = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F0F1),
      // backgroundColor: Colors.black,
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
                const Text("Value"),
                const Text(
                  "ℹ️ Change the value using the slider ",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                      fontSize: 10),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              // height: 500,
              // width: 400,
              child: RadialGauge(
                radiusFactor: 0.8,

                track: const RadialTrack(
                  hideTrack: false,
                  thickness: 60,
                  color: Color(0xffE3E2E3),
                  start: 0,
                  trackStyle: TrackStyle(
                      showLabel: false,
                      secondaryRulerPerInterval: 6,
                      primaryRulerColor: Color(0xffC7C6C7),
                      primaryRulersHeight: 3,
                      secondaryRulersHeight: 3,
                      secondaryRulersWidth: 5,
                      primaryRulersWidth: 5,
                      rulersOffset: -60,
                      // primaryRulersWidth: 5,
                      secondaryRulerColor: Color(0xffC7C6C7)),
                  end: 100,
                  startAngle: 0,
                  endAngle: 360,
                ),
                shapePointer: [
                  RadialShapePointer(
                    value: value2,
                    isInteractive: true,
                    color: const Color(0xff536068),
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
                  // RadialValueBar(
                  //   value: value2,
                  //   valueBarThickness: 1,

                  //   color: Colors.black.withOpacity(0.3),

                  //   // valueBarThickness: 100,
                  // )
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
          ),
        ],
      ),
    );
  }
}
