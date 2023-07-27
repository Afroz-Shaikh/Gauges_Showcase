import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class TaskTracker extends StatelessWidget {
  const TaskTracker({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff182027),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height / 4),
            child: Center(
                child: RichText(
                    text: const TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "80",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30)),
              TextSpan(
                  text: " /100",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w100))
            ]))),
          ),
          RadialGauge(
            radiusFactor: 0.9,
            valueBar: [
              const RadialValueBar(
                value: 80,
                valueBarThickness: 33,
                radialOffset: 36,
                color: Color(0xffb9f342),
              ),
              RadialValueBar(
                value: 100,
                // valueBarThickness: 33,
                radialOffset: 106,
                color: const Color(0xff383f45).withOpacity(0.3),
              )
            ],
            needlePointer: const [
              NeedlePointer(
                value: 80,
                tailColor: Color(0xff383f45),
              ),
              NeedlePointer(
                value: 80,
                tailColor: Colors.white,
                tailRadius: 60,
                color: Colors.white,
              ),
              NeedlePointer(
                value: 30,
                color: Colors.transparent,
                tailColor: Colors.black,
                tailRadius: 20,
              ),
            ],
            track: const RadialTrack(
                start: 0,
                end: 100,
                color: Color(0xff383f45),
                startAngle: 90,
                endAngle: 450,
                thickness: 30,
                trackStyle: TrackStyle(
                  showPrimaryRulers: false,
                  showSecondaryRulers: false,
                  showLabel: false,
                )),
          ),
        ],
      ),
    );
  }
}
