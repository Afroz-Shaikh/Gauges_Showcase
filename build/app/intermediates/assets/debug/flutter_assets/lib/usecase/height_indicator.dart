import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeightIndicator(),
    ),
  );
}

class HeightIndicator extends StatefulWidget {
  const HeightIndicator({super.key});

  @override
  State<HeightIndicator> createState() => _HeightIndicatorState();
}

class _HeightIndicatorState extends State<HeightIndicator> {
  double height = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double screenHeight = constraints.maxHeight - 10;
        return SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                // color: Colors.blue,
                child: Image.asset(
                  'assets/bmi_light.png',
                  height: ((height / 200) * 100) * (screenHeight / 100),
                  color: Colors.red,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                child: LinearGauge(
                  gaugeOrientation: GaugeOrientation.vertical,
                  customLabels: const [
                    CustomRulerLabel(text: "0 cm", value: 0),
                    CustomRulerLabel(text: "25 cm", value: 25),
                    CustomRulerLabel(text: "50 cm", value: 50),
                    CustomRulerLabel(text: "75 cm", value: 75),
                    CustomRulerLabel(text: "100 cm", value: 100),
                    CustomRulerLabel(text: "125 cm", value: 125),
                    CustomRulerLabel(text: "150 cm", value: 150),
                    CustomRulerLabel(text: "175 cm", value: 175),
                    CustomRulerLabel(text: "200 cm", value: 200),
                  ],
                  pointers: [
                    Pointer(
                        value: height,
                        shape: PointerShape.triangle,
                        isInteractive: true,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        pointerPosition: PointerPosition.right),
                    Pointer(
                      value: height,
                      height: 2,
                      width: 100,
                      color: Colors.red,
                      shape: PointerShape.rectangle,
                      pointerPosition: PointerPosition.left,
                    )
                  ],
                  linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                    thickness: 10,
                  ),
                  rulers: RulerStyle(
                    rulerPosition: RulerPosition.left,
                    // showSecondaryRulers: false,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
