//! Code
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SpaceDemo(),
//     ),
//   );
// }

class SpaceDemo extends StatefulWidget {
  const SpaceDemo({super.key});

  @override
  State<SpaceDemo> createState() => _SpaceDemoState();
}

class _SpaceDemoState extends State<SpaceDemo> {
  double value = 382;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/stars.png",
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.overlay,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  // color: Colors.blue.withOpacity(0.4),
                  child: Image.asset(
                    'assets/moon.png',
                    scale: 2,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 300,
                  // color: Colors.blue,
                  child: Image.asset("assets/earth.png"),
                  // height: 100,
                ),
              ],
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: LinearGauge(
                  start: 0,
                  end: 382,
                  gaugeOrientation: GaugeOrientation.vertical,
                  customLabels: const [
                    CustomRulerLabel(text: "0km", value: 0),
                    CustomRulerLabel(
                        text: "500 km(Module 1 Separation)", value: 112),
                    CustomRulerLabel(text: "191250 km", value: 191),
                    CustomRulerLabel(
                        text: "500 km(Module 2 Separation)", value: 272),
                    CustomRulerLabel(text: "382500 km", value: 382),
                  ],
                  pointers: [
                    WidgetPointer(
                        value: value,
                        pointerPosition: PointerPosition.right,
                        isInteractive: true,
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                          });
                        },
                        child: Image.asset(
                          "assets/spacerocket.png",
                          scale: 6,
                        ))
                  ],
                  valueBar: [ValueBar(value: value)],
                  rulers: RulerStyle(
                    primaryRulerColor: Colors.white,
                    inverseRulers: false,
                    rulerPosition: RulerPosition.left,
                    labelOffset: 10,
                    rulersOffset: 10,
                    primaryRulersHeight: 30,
                    textStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyGaugeExample extends StatefulWidget {
  const MyGaugeExample({Key? key}) : super(key: key);

  @override
  State<MyGaugeExample> createState() => _MyGaugeExampleState();
}

class _MyGaugeExampleState extends State<MyGaugeExample> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          pointers: [
            Pointer(
              value: value,
              height: 40,
              shape: PointerShape.circle,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            )
          ],
          rulers: RulerStyle(rulerPosition: RulerPosition.bottom),
        ),
      ),
    );
  }
}
