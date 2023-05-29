import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class TemperatureMeter extends StatefulWidget {
  const TemperatureMeter({super.key});

  @override
  State<TemperatureMeter> createState() => _TemperatureMeterState();
}

class _TemperatureMeterState extends State<TemperatureMeter> {
  double temperature = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearGauge(
                pointers: [
                  Pointer(
                      height: 30,
                      width: 40,
                      isInteractive: true,
                      value: temperature,
                      color: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          temperature = value;
                        });
                      },
                      shape: PointerShape.triangle,
                      pointerPosition: PointerPosition.top)
                ],
                customLabels: const [
                  CustomRulerLabel(text: "0°c", value: 0),
                  CustomRulerLabel(text: "20°c", value: 20),
                  CustomRulerLabel(text: "40°c", value: 40),
                  CustomRulerLabel(text: "60°c", value: 60),
                  CustomRulerLabel(text: "80°c", value: 80),
                ],
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                  thickness: 30,
                  linearGradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.greenAccent,
                      Colors.amber,
                      Colors.orange,
                      Colors.redAccent,
                      Colors.red,
                    ],
                  ),
                ),
                rulers: RulerStyle(
                  showLabel: true,
                  showPrimaryRulers: true,
                  // textStyle: TextStyle(color: primaryColor),
                  rulerPosition: RulerPosition.bottom,
                  // primaryRulerColor: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
