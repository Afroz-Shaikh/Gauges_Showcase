import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class RadialCompass extends StatefulWidget {
  const RadialCompass({super.key});

  @override
  State<RadialCompass> createState() => _RadialCompassState();
}

class _RadialCompassState extends State<RadialCompass> {
  double value = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: const RadialGauge(
            radiusFactor: 0.8,
            needlePointer: [
              NeedlePointer(
                value: 50,
                color: Colors.blueGrey,
                tailColor: Colors.transparent,
                needleHeight: 400,
              ),
              NeedlePointer(
                value: 0,
                color: Colors.red,
                needleHeight: 400,
                tailColor: Colors.transparent,
              ),
            ],
            track: RadialTrack(
              color: Colors.white,
              trackStyle: TrackStyle(
                  primaryRulerColor: Colors.white,
                  showLabel: false,
                  secondaryRulerColor: Colors.white),
              startAngle: 90,
              endAngle: 450,
              start: 0,
              end: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class CaloriesTracker extends StatefulWidget {
  const CaloriesTracker({super.key});

  @override
  State<CaloriesTracker> createState() => _CaloriesTrackerState();
}

class _CaloriesTrackerState extends State<CaloriesTracker> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconLabel(
                  text: "1430",
                  icon: Icons.run_circle,
                  iconColor: Colors.red,
                ),
                IconLabel(
                    text: "11 min",
                    icon: Icons.sports_gymnastics,
                    iconColor: Colors.green),
                IconLabel(
                    text: "51", icon: Icons.water_drop, iconColor: Colors.blue),

                // IconLable(text: "text", icon: icon)
              ],
            )),
            RadialGauge(
              radiusFactor: 0.7,
              valueBar: [
                RadialValueBar(
                  value: 100,
                  color: Colors.green.withOpacity(0.7),
                  valueBarThickness: 2,
                  radialOffset: 60,
                ),
                const RadialValueBar(
                  value: 10,
                  color: Colors.green,
                  valueBarThickness: 13,
                  radialOffset: 60,
                ),
                RadialValueBar(
                  value: 100,
                  color: Colors.blue.withOpacity(0.7),
                  valueBarThickness: 2,
                  radialOffset: 30,
                ),
                const RadialValueBar(
                  value: 30,
                  color: Colors.blue,
                  valueBarThickness: 12,
                  radialOffset: 30,
                ),
                RadialValueBar(
                  value: 100,
                  color: Colors.red.withOpacity(0.7),
                  valueBarThickness: 2,
                  radialOffset: 90,
                ),
                const RadialValueBar(
                  value: 70,
                  color: Colors.red,
                  valueBarThickness: 12,
                  radialOffset: 90,
                ),
              ],
              track: const RadialTrack(
                color: Colors.red,
                startAngle: 90,
                // hideLabels: true,
                endAngle: 450,
                // steps: 10,
                trackStyle: TrackStyle(
                  primaryRulersHeight: 10,
                  secondaryRulersWidth: 1,
                  showLabel: false,
                  showPrimaryRulers: false,
                  showSecondaryRulers: false,
                ),
                hideTrack: true,
                // hideStartLabel: ,
                start: 0,
                thickness: 10,
                end: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class IconLabel extends StatelessWidget {
  IconLabel({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });
  String text;
  IconData icon;
  Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            elevation: 0,
            backgroundColor: Colors.transparent),
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(text));
  }
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          pointers: [
            Pointer(
              value: value,
              height: 40,
              shape: PointerShape.circle,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            )
          ],
          rulers: RulerStyle(rulerPosition: RulerPosition.bottom),
        ),
      ),
    );
  }
}
