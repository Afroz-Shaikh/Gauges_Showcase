import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class BloodSugarTest extends StatelessWidget {
  const BloodSugarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  labelWidget(Colors.green, "Great (60-71)"),
                  labelWidget(Colors.lime, "Good (71-80)"),
                  labelWidget(Colors.yellow, "Normal (80-98)"),
                  labelWidget(Colors.orange, "Pre-Diabetes (98-108)"),
                ],
              ),
              const Spacer(flex: 1),
              LinearGauge(
                linearGaugeBoxDecoration:
                    const LinearGaugeBoxDecoration(thickness: 30),
                gaugeOrientation: GaugeOrientation.horizontal,
                customLabels: const [
                  CustomRulerLabel(text: "60", value: 60),
                  CustomRulerLabel(text: "71", value: 71),
                  CustomRulerLabel(text: "80", value: 80),
                  CustomRulerLabel(text: "98", value: 98),
                  CustomRulerLabel(text: "108", value: 108),
                ],
                pointers: const [
                  Pointer(
                      value: 75,
                      color: Colors.blue,
                      height: 30,
                      width: 40,
                      labelStyle: TextStyle(color: Colors.blue),
                      shape: PointerShape.triangle,
                      pointerPosition: PointerPosition.top)
                ],
                rulers: const RulerStyle(
                    rulerPosition: RulerPosition.bottom,
                    showSecondaryRulers: false,
                    textStyle: TextStyle(color: Colors.black)),
                rangeLinearGauge: [
                  RangeLinearGauge(color: Colors.green, start: 60, end: 71),
                  RangeLinearGauge(color: Colors.lime, start: 71, end: 80),
                  RangeLinearGauge(color: Colors.yellow, start: 80, end: 98),
                  RangeLinearGauge(color: Colors.orange, start: 98, end: 108),
                ],
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget labelWidget(
  Color color,
  String text,
) {
  return Row(
    children: [
      Icon(Icons.rectangle, color: color),
      Text(text),
    ],
  );
}
