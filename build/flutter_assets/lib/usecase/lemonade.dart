import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class LemonadeGauge extends StatelessWidget {
  const LemonadeGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Center(
        child: LinearGauge(
          gaugeOrientation: GaugeOrientation.vertical,
          start: 0,
          end: 10,
          rangeLinearGauge: [
            RangeLinearGauge(color: Colors.blue, start: 0, end: 150),
            RangeLinearGauge(color: Colors.lime, start: 150, end: 220),
            RangeLinearGauge(color: Colors.grey, start: 230, end: 230),
          ],
          customLabels: const [
            CustomRulerLabel(text: "250 ml", value: 0),
            CustomRulerLabel(text: "Water", value: 100),
            CustomRulerLabel(text: "150 ml", value: 150),
            CustomRulerLabel(text: "Lemon", value: 180),
            CustomRulerLabel(text: "20 ml", value: 220),
            CustomRulerLabel(text: "Sugar", value: 235),
            CustomRulerLabel(text: "0 ml", value: 250),
          ],
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 250, backgroundColor: Colors.grey, borderRadius: 30),
          rulers: const RulerStyle(
            inverseRulers: true,
            showPrimaryRulers: false,
            showSecondaryRulers: false,
            rulerPosition: RulerPosition.right,
          ),
        ),
      ),
    );
  }
}
