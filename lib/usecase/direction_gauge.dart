import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class DirectionGauge extends StatelessWidget {
  const DirectionGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '0° NE',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        LinearGauge(
            showLinearGaugeContainer: false,
            customLabels: const [
              CustomRulerLabel(text: '260°', value: 0),
              CustomRulerLabel(text: '310°', value: 20),
              CustomRulerLabel(text: '0°', value: 40),
              CustomRulerLabel(text: '50°', value: 60),
              CustomRulerLabel(text: '100°', value: 80),
            ],
            rulers: const RulerStyle(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                rulerPosition: RulerPosition.bottom,
                showLabel: true,
                showPrimaryRulers: false,
                showSecondaryRulers: false)),
        Center(
          child: LinearGauge(
            pointers: const [
              Pointer(
                  value: 50,
                  shape: PointerShape.rectangle,
                  height: 50,
                  width: 5,
                  pointerAlignment: PointerAlignment.start)
            ],
            steps: 1,
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 30, backgroundColor: Colors.green, borderRadius: 0),
            rulers: const RulerStyle(
                rulerPosition: RulerPosition.center,
                showLabel: false,
                primaryRulersHeight: 30,
                primaryRulersWidth: 4,
                showSecondaryRulers: false,
                primaryRulerColor: Colors.white),
          ),
        ),
      ],
    );
  }
}
