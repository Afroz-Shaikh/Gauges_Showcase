import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class Thermometer extends StatelessWidget {
  const Thermometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 600,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearGauge(
              enableGaugeAnimation: false,
              value: -20,
              start: -20,
              steps: 10,
              end: 50,
              extendLinearGauge: 45,
              fillExtend: true,
              valueBar: [
                ValueBar(
                    value: 30,
                    enableAnimation: true,
                    animationDuration: 3000,
                    animationType: Curves.easeInOutCubic,
                    valueBarThickness: 15,
                    color: Colors.blue,
                    borderRadius: 10)
              ],
              gaugeOrientation: GaugeOrientation.vertical,
              linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                borderRadius: 20,
                thickness: 25,
              ),
              rulers: const RulerStyle(
                  rulerPosition: RulerPosition.left,
                  showSecondaryRulers: false),
              pointers: const [
                Pointer(
                  shape: PointerShape.circle,
                  value: -28,
                  color: Colors.grey,
                  enableAnimation: false,
                  showLabel: false,
                  height: 45,
                  pointerPosition: PointerPosition.center,
                  pointerAlignment: PointerAlignment.center,
                ),
                Pointer(
                  shape: PointerShape.circle,
                  value: -25,
                  enableAnimation: false,
                  color: Colors.blue,
                  showLabel: false,
                  height: 35,
                  pointerPosition: PointerPosition.center,
                  pointerAlignment: PointerAlignment.end,
                ),
                Pointer(
                  shape: PointerShape.rectangle,
                  value: -25.5,
                  color: Colors.blue,
                  showLabel: false,
                  height: 16,
                  width: 16,
                  pointerPosition: PointerPosition.center,
                  pointerAlignment: PointerAlignment.center,
                )
              ],
            ),
            LinearGauge(
              start: 0,
              end: 120,
              steps: 20,
              extendLinearGauge: 57,
              gaugeOrientation: GaugeOrientation.vertical,
              showLinearGaugeContainer: false,
              linearGaugeBoxDecoration:
                  const LinearGaugeBoxDecoration(thickness: 0),
              rulers: const RulerStyle(
                  rulerPosition: RulerPosition.right,
                  showSecondaryRulers: false),
            ),
          ],
        ),
      ),
    );
  }
}
