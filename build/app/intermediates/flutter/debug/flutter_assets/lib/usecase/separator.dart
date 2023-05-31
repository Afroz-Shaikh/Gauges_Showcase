import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: LinearGauge(
            enableGaugeAnimation: true,

            animationGap: 0.9,
            linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
                thickness: 30.0,
                borderRadius: 30,
                linearGaugeValueColor: Colors.green,
                edgeStyle: LinearEdgeStyle.bothCurve,
                backgroundColor: Colors.grey.shade300),
            start: 0,
            // value: 70,
            end: 100,
            gaugeOrientation: GaugeOrientation.horizontal,
            valueBar: const [
              ValueBar(
                  value: 70,
                  color: Colors.green,
                  valueBarThickness: 30,
                  borderRadius: 30)
            ],
            pointers: const [
              Pointer(
                  shape: PointerShape.rectangle,
                  value: 70,
                  color: Colors.black,
                  pointerAlignment: PointerAlignment.start,
                  height: 35)
            ],
            rulers: RulerStyle(
              secondaryRulersWidth: 4,
              secondaryRulerPerInterval: 1,
              secondaryRulersHeight: 30,
              secondaryRulerColor: Colors.black,
              showPrimaryRulers: false,
              rulersOffset: 10,
              labelOffset: 10,
              inverseRulers: false,
              rulerPosition: RulerPosition.center,
              showLabel: false,
            ),
          ),
        ),
      ),
    );
  }
}
