import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:showcase_app/widgets/playground_header.dart';

import '../utils/colors.dart';

class RadialGaugePlayground extends StatefulWidget {
  const RadialGaugePlayground({super.key});

  @override
  State<RadialGaugePlayground> createState() => _RadialGaugePlaygroundState();
}

class _RadialGaugePlaygroundState extends State<RadialGaugePlayground> {
  double value = 30;
  double rulerOffset = 0;
  // double la

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Flex(
          direction:
              screenWidth > screenHeight ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: RadialGaugeView(
                  value: value,
                )),
            Flexible(
                flex: screenWidth > 700 ? 1 : 0,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    padding: const EdgeInsets.all(8),
                    height: screenWidth > 700 ? screenHeight : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PlayGroundHeader(text: "Value"),
                        buildValueHandler(),
                      ],
                    ),
                  ),
                ))),
          ]),
    );
  }

  buildValueHandler() {
    return Slider(
        min: 0,
        max: 100,
        value: value,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        onChanged: (double value) {
          setState(() {
            this.value = value;
          });
        });
  }
}

class RadialGaugeView extends StatefulWidget {
  const RadialGaugeView({super.key, required this.value});
  final double value;
  @override
  State<RadialGaugeView> createState() => _RadialGaugeViewState();
}

class _RadialGaugeViewState extends State<RadialGaugeView> {
  @override
  Widget build(BuildContext context) {
    return RadialGauge(
      track: const RadialTrack(start: 0, end: 100, startAngle: -30),
      valueBar: [RadialValueBar(value: widget.value)],
      needlePointer: [
        NeedlePointer(
          value: widget.value,
          tailRadius: 80,
        ),
      ],
    );
  }
}
