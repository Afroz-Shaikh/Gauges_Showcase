import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiskSpace(),
    ),
  );
}

class DiskSpace extends StatelessWidget {
  const DiskSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [],
              ),
              const Spacer(flex: 1),
              LinearGauge(
                enableGaugeAnimation: true,
                showLinearGaugeContainer: true,
                linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                  thickness: 20,
                  borderRadius: 100,
                ),
                gaugeOrientation: GaugeOrientation.horizontal,
                rulers: RulerStyle(
                    rulerPosition: RulerPosition.bottom,
                    showSecondaryRulers: false,
                    showPrimaryRulers: false,
                    showLabel: false,
                    textStyle: const TextStyle(color: Colors.black)),
                rangeLinearGauge: [
                  RangeLinearGauge(color: Colors.green, start: 0, end: 75),
                  RangeLinearGauge(color: Colors.red, start: 75, end: 80),
                  RangeLinearGauge(
                      color: Colors.blue.shade900, start: 80, end: 100),
                ],
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  const Text("Disk utilization "),
                  labelWidget(Colors.green, "Documents"),
                  labelWidget(Colors.red, "Downloads"),
                  labelWidget(Colors.blue.shade900, "Music"),
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
      Icon(Icons.circle, color: color),
      const SizedBox(
        width: 5,
      ),
      Text(text),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
