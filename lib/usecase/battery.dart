import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

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
