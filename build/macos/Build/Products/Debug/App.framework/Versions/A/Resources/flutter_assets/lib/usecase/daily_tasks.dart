import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeeklyOverview(),
    ),
  );
}

class WeeklyOverview extends StatelessWidget {
  const WeeklyOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LinearGauge(
            showLinearGaugeContainer: false,
            pointers: const [
              // Monday
              Pointer(
                  value: 10,
                  shape: PointerShape.rectangle,
                  pointerAlignment: PointerAlignment.end,
                  pointerPosition: PointerPosition.top,
                  height: 30,
                  color: Colors.amber,
                  width: 50),
              // Tuesday
              Pointer(
                  value: 20,
                  shape: PointerShape.rectangle,
                  pointerAlignment: PointerAlignment.end,
                  pointerPosition: PointerPosition.top,
                  height: 30,
                  color: Colors.amber,
                  width: 50),

              // Wednesday
              Pointer(
                  value: 30,
                  shape: PointerShape.rectangle,
                  pointerAlignment: PointerAlignment.end,
                  pointerPosition: PointerPosition.top,
                  height: 90,
                  color: Colors.amber,
                  width: 50),
            ],
            customLabels: const [
              CustomRulerLabel(text: "Mon", value: 10),
              CustomRulerLabel(text: "Tue", value: 20),
              CustomRulerLabel(text: "Wed", value: 30),
              CustomRulerLabel(text: "Thu", value: 40),
              CustomRulerLabel(text: "Fri", value: 50),
              CustomRulerLabel(text: "Sat", value: 60),
              CustomRulerLabel(text: "Sun", value: 70),
            ],
            rulers: RulerStyle(
                rulerPosition: RulerPosition.bottom,
                showSecondaryRulers: false)),
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
