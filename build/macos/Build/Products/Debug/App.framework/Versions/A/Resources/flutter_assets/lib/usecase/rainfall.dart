import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class Rainfall extends StatefulWidget {
  const Rainfall({super.key});

  @override
  State<Rainfall> createState() => _RainfallState();
}

class _RainfallState extends State<Rainfall> {
  double rainfall = 5.3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: const Text(
            "Total Rainfall",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: LinearGauge(
            enableGaugeAnimation: true,
            start: 0,
            end: 10,
            rangeLinearGauge: [
              RangeLinearGauge(color: Colors.red, start: 0, end: 2),
              RangeLinearGauge(color: Colors.yellow, start: 2, end: 3),
              RangeLinearGauge(color: Colors.green, start: 3, end: 7),
              RangeLinearGauge(color: Colors.yellow, start: 7, end: 8),
              RangeLinearGauge(color: Colors.red, start: 8, end: 10),
            ],
            pointers: [
              Pointer(
                  isInteractive: true,
                  value: rainfall,
                  onChanged: (value) {
                    setState(() {
                      rainfall = value;
                    });
                  },
                  shape: PointerShape.triangle,
                  width: 30,
                  height: 30,
                  pointerPosition: PointerPosition.top)
            ],
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 30, backgroundColor: Colors.green, borderRadius: 10),
            rulers: RulerStyle(
              rulerPosition: RulerPosition.top,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text('Drought Hazard'), Text('Flood Hazard')],
          ),
        )
      ],
    );
  }
}
