import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class TaskTracker extends StatelessWidget {
  const TaskTracker({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff182027),
      body: Stack(
        children: [
          RadialGauge(
            radiusFactor: 0.9,
            valueBar: [
              RadialValueBar(
                value: 80,
                valueBarThickness: width > 600 ? 33 : 20,
                radialOffset: width > 600 ? 36 : 20,
                color: Color(0xffb9f342),
              ),
              RadialValueBar(
                value: 100,
                // valueBarThickness: 33,
                radialOffset: 106,
                color: const Color(0xff383f45).withOpacity(0.3),
              )
            ],
            needlePointer: [
              // NeedlePointer(
              //   value: 80,
              //   tailColor: Color(0xff383f45),
              // ),
              NeedlePointer(
                value: 80,
                needleWidth: width > 600 ? 30 : 10,
                tailColor: Colors.white,
                tailRadius: width > 600 ? 60 : 20,
                color: Colors.white,
              ),
              NeedlePointer(
                value: 30,
                color: Colors.transparent,
                tailColor: Colors.black,
                tailRadius: width > 600 ? 20 : 10,
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
          Padding(
            padding: EdgeInsets.only(top: height / 4),
            child: Center(
                child: RichText(
                    text: const TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "80",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Colors.white)),
              TextSpan(
                  text: " /100",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w100))
            ]))),
          ),
        ],
      ),
    );
  }
}
