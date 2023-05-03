import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

import '../utils/colors.dart';
import '../widgets/playground_header.dart';

class CustomCurvePlayGround extends StatefulWidget {
  const CustomCurvePlayGround({super.key});

  @override
  State<CustomCurvePlayGround> createState() => _CustomCurvePlayGroundState();
}

class _CustomCurvePlayGroundState extends State<CustomCurvePlayGround> {
  // Configurations
  GaugeOrientation orientation = GaugeOrientation.horizontal;
  CurvePosition curvePosition = CurvePosition.top;
  double midPoint = 50;
  double startHeight = 100;
  double endHeight = 100;
  double midHeight = 10;

  CurveStyle curveStyle = CurveStyle.bezier;
  PaintStyle paintStyle = PaintStyle.fill;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Flex(
      direction: screenWidth > 1000 ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinearGaugeView(
          paintStyle: paintStyle,
          curveStyle: curveStyle,
          startHeight: startHeight,
          endHeight: endHeight,
          midHeight: midHeight,
          midPoint: midPoint,
          curvePosition: curvePosition,
          orientation: orientation,
        ),
        Flexible(
          flex: screenWidth > 700 ? 1 : 3,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: Container(
                  color: const Color(0xffF5F8FA),
                  padding: const EdgeInsets.all(8),
                  height: screenWidth > 700 ? screenHeight : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PlayGroundHeader(text: "Gauge Orientation"),
                      buildOrientationHandler(),
                      const Divider(),
                      const PlayGroundHeader(text: "Curve Style"),
                      buildBezierHandler(),
                      const PlayGroundHeader(text: "Paint Style"),
                      buildPaintHandler(),
                      const PlayGroundHeader(text: "Custom Curve Position"),
                      buildCustomCurvePositionHandler(),
                      const Divider(),
                      const PlayGroundHeader(text: "Mid Value"),
                      buildMidPointHandler(),
                      const PlayGroundHeader(text: "Start Height"),
                      buildStartHeightHandler(),
                      const PlayGroundHeader(text: "End Height"),
                      buildEndHeightHandler(),
                      const PlayGroundHeader(text: "Mid Height"),
                      buildMidHeightHandler(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget buildBezierHandler() {
    final Map<CurveStyle, Widget> children = {
      CurveStyle.bezier: const Text('Bezier'),
      CurveStyle.linear: const Text('Linear'),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CupertinoSlidingSegmentedControl<CurveStyle>(
        groupValue: curveStyle,
        children: children,
        onValueChanged: (CurveStyle? value) {
          setState(() {
            if (value != null) {
              curveStyle = value;
              _updateCurvePosition();
            }
          });
        },
      ),
    );
  }

  Widget buildPaintHandler() {
    final Map<PaintStyle, Widget> children = {
      PaintStyle.fill: const Text('Fill'),
      PaintStyle.stroke: const Text('Stroke'),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CupertinoSlidingSegmentedControl<PaintStyle>(
        groupValue: paintStyle,
        children: children,
        onValueChanged: (PaintStyle? value) {
          setState(() {
            if (value != null) {
              paintStyle = value;
              _updateCurvePosition();
            }
          });
        },
      ),
    );
  }

  Widget buildOrientationHandler() {
    final Map<GaugeOrientation, Widget> children = {
      GaugeOrientation.horizontal: const Text('Horizontal'),
      GaugeOrientation.vertical: const Text('Vertical'),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CupertinoSlidingSegmentedControl<GaugeOrientation>(
        groupValue: orientation,
        children: children,
        onValueChanged: (GaugeOrientation? value) {
          setState(() {
            if (value != null) {
              orientation = value;
              _updateCurvePosition();
            }
          });
        },
      ),
    );
  }

  void _updateCurvePosition() {
    if (orientation == GaugeOrientation.vertical) {
      curvePosition = curvePosition == CurvePosition.bottom
          ? CurvePosition.left
          : CurvePosition.right;
    } else if (orientation == GaugeOrientation.horizontal) {
      curvePosition = curvePosition == CurvePosition.left
          ? CurvePosition.bottom
          : CurvePosition.top;
    }
  }

  buildCustomCurvePositionHandler() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text('Curve Position', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<CurvePosition>(
                    borderRadius: BorderRadius.circular(10),
                    value: curvePosition,
                    items: orientation == GaugeOrientation.horizontal
                        ? const [
                            DropdownMenuItem(
                              value: CurvePosition.top,
                              child: Text('top'),
                            ),
                            DropdownMenuItem(
                              value: CurvePosition.bottom,
                              child: Text('bottom'),
                            ),
                          ]
                        : const [
                            DropdownMenuItem(
                              value: CurvePosition.left,
                              child: Text('left'),
                            ),
                            DropdownMenuItem(
                              value: CurvePosition.right,
                              child: Text('right'),
                            ),
                          ],
                    onChanged: (CurvePosition? value) {
                      setState(() {
                        handlePositionChange(value!);
                      });
                    }),
              )),
        )
      ],
    );
  }

  void handlePositionChange(CurvePosition? value) {
    if (value != null) {
      if (value == CurvePosition.top) {
        curvePosition = CurvePosition.top;
      }
      if (value == CurvePosition.bottom) {
        curvePosition = CurvePosition.bottom;
      }
      if (value == CurvePosition.left) {
        curvePosition = CurvePosition.left;
      }
      if (value == CurvePosition.right) {
        curvePosition = CurvePosition.right;
      }
    }
  }

  buildMidPointHandler() {
    return Slider(
        min: 0,
        max: 100,
        value: midPoint,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        onChanged: (double value) {
          setState(() {
            midPoint = value;
          });
        });
  }

  buildMidHeightHandler() {
    return Slider(
        min: -100,
        max: 100,
        value: midHeight,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        onChanged: (double value) {
          setState(() {
            midHeight = value;
          });
        });
  }

  buildStartHeightHandler() {
    return Slider(
        min: 0,
        max: 100,
        value: startHeight,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        onChanged: (double value) {
          setState(() {
            startHeight = value;
          });
        });
  }

  buildEndHeightHandler() {
    return Slider(
        min: 0,
        max: 100,
        value: endHeight,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        onChanged: (double value) {
          setState(() {
            endHeight = value;
          });
        });
  }
}

class LinearGaugeView extends StatelessWidget {
  const LinearGaugeView({
    super.key,
    required this.orientation,
    required this.curvePosition,
    required this.midPoint,
    required this.startHeight,
    required this.endHeight,
    required this.midHeight,
    required this.curveStyle,
    required this.paintStyle,
  });

  final GaugeOrientation orientation;
  final CurvePosition curvePosition;
  final double midPoint;
  final double startHeight;
  final double endHeight;
  final double midHeight;
  final CurveStyle curveStyle;
  final PaintStyle paintStyle;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 30),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        child: LinearGauge(
          curves: [
            CustomCurve(
                midPoint: midPoint,
                startHeight: startHeight,
                endHeight: endHeight,
                paintStyle: paintStyle,
                midHeight: midHeight,
                curveStyle: curveStyle,
                curvePosition: curvePosition)
          ],
          gaugeOrientation: orientation,
          rulers: RulerStyle(
            inverseRulers: false,
            rulerPosition: orientation == GaugeOrientation.horizontal
                ? RulerPosition.bottom
                : RulerPosition.right,
          ),
        ),
      ),
    );
  }
}
