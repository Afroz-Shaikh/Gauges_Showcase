import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:showcase_app/radial_usecases/tracker.dart';

class ActivityTracker extends StatefulWidget {
  const ActivityTracker({super.key});

  @override
  State<ActivityTracker> createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
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
