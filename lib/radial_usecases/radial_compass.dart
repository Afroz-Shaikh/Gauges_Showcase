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
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const RadialGauge(
          track: RadialTrack(
            color: Colors.white,
            trackStyle: TrackStyle(
                primaryRulerColor: Colors.white,
                showLabel: false,
                secondaryRulerColor: Colors.white),
            startAngle: 0,
            endAngle: 360,
            start: 0,
            end: 100,
          ),
          needlePointer: [
            NeedlePointer(
              value: 0,
              color: Colors.red,
              tailColor: Colors.transparent,
            ),
            NeedlePointer(
              value: 50,
              color: Colors.blueGrey,
              tailColor: Colors.transparent,
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
