import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class Rainfall extends StatelessWidget {
  const Rainfall({super.key});

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
            start: 0,
            end: 10,
            rangeLinearGauge: [
              RangeLinearGauge(color: Colors.red, start: 0, end: 2),
              RangeLinearGauge(color: Colors.yellow, start: 2, end: 3),
              RangeLinearGauge(color: Colors.green, start: 3, end: 7),
              RangeLinearGauge(color: Colors.yellow, start: 7, end: 8),
              RangeLinearGauge(color: Colors.red, start: 8, end: 10),
            ],
            pointers: const [
              Pointer(
                  value: 5.3,
                  shape: PointerShape.triangle,
                  width: 30,
                  height: 30,
                  pointerPosition: PointerPosition.top)
            ],
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 30, backgroundColor: Colors.green, borderRadius: 10),
            rulers: const RulerStyle(
              rulerPosition: RulerPosition.top,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Drought Hazard'), Text('Flood Hazard')],
          ),
        )
      ],
    );
  }
}

class LemonadeGauge extends StatelessWidget {
  const LemonadeGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearGauge(
        gaugeOrientation: GaugeOrientation.vertical,
        start: 0,
        end: 10,
        customLabels: const [
          CustomRulerLabel(text: "0 ml", value: 0),
          CustomRulerLabel(text: "100 ml", value: 10),
          CustomRulerLabel(text: "150 ml", value: 150),
          CustomRulerLabel(text: "200ml", value: 200),
          CustomRulerLabel(text: "250ml", value: 250)
        ],
        linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 50, backgroundColor: Colors.green, borderRadius: 10),
        rulers: const RulerStyle(
          showPrimaryRulers: false,
          rulerPosition: RulerPosition.right,
        ),
      ),
    );
  }
}
