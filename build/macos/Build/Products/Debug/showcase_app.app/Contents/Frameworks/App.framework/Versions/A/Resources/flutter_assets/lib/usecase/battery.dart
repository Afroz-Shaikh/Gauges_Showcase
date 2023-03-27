import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Battery(),
    ),
  );
}

class Battery extends StatelessWidget {
  const Battery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            color: Colors.red,
            height: 40,
            width: MediaQuery.of(context).size.width / 2,
            child: Center(
              child: LinearGauge(
                  linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                      backgroundColor: Colors.blue),
                  gaugeOrientation: GaugeOrientation.horizontal,
                  start: 0,
                  end: 100,
                  pointers: const [
                    Pointer(
                        value: 25,
                        height: 30,
                        color: Colors.blue,
                        shape: PointerShape.circle,
                        pointerPosition: PointerPosition.top)
                  ],
                  rulers: const RulerStyle(
                    rulersOffset: 11,
                    rulerPosition: RulerPosition.bottom,
                    showSecondaryRulers: false,
                    primaryRulerColor: Colors.white,
                    showLabel: true,
                    primaryRulersWidth: 4,
                    primaryRulersHeight: 30,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

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
                thickness: 30, backgroundColor: Colors.green, borderRadius: 10),
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
