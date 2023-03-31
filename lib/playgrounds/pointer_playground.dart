import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'package:showcase_app/utils/snackbar.dart';

import '../utils/utils.dart';
import '../widgets/playground_header.dart';

class PointerPlayGround extends StatefulWidget {
  const PointerPlayGround({super.key});

  @override
  State<PointerPlayGround> createState() => _PointerPlayGroundState();
}

class _PointerPlayGroundState extends State<PointerPlayGround> {
  // Configurations
  PointerShape shape = PointerShape.triangle;
  double value = 0;
  PointerPosition pointerPosition = PointerPosition.center;
  double height = 10;
  double width = 10;
  bool reverse = false;
  PointerAlignment alignment = PointerAlignment.center;
  GaugeOrientation orientation = GaugeOrientation.horizontal;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Flex(
      direction: screenWidth > 1000 ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinearGaugeView(
            value: value,
            height: height,
            width: width,
            shape: shape,
            position: pointerPosition,
            alignment: alignment,
            orientation: orientation,
            reverse: reverse),
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
                      const PlayGroundHeader(text: "Ruler Style"),
                      inverseAxisHandler(),
                      const Divider(),
                      const PlayGroundHeader(text: "Pointer"),
                      buildValueHandler(),
                      const Divider(),
                      buildPointerWidgetHandler(),
                      buildPointerPositionHandler(),
                      buildPointerAlignmentHandler(),
                      const Divider(),
                      const Text('Pointer Height'),
                      buildPointerHeightHandler(),
                      const Text('Pointer Width'),
                      buildPointerWidthHandler(),
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
              _updateValueBarPosition();
            }
          });
        },
      ),
    );
  }

  void _updateValueBarPosition() {
    if (orientation == GaugeOrientation.vertical) {
      pointerPosition = pointerPosition == PointerPosition.bottom
          ? PointerPosition.left
          : pointerPosition == PointerPosition.center
              ? PointerPosition.center
              : PointerPosition.right;
    } else if (orientation == GaugeOrientation.horizontal) {
      pointerPosition = pointerPosition == PointerPosition.left
          ? PointerPosition.bottom
          : pointerPosition == PointerPosition.center
              ? PointerPosition.center
              : PointerPosition.top;
    }
  }

  Widget inverseAxisHandler() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Inverse Rulers"),
          CupertinoSwitch(
            activeColor: primaryColor,
            value: reverse,
            onChanged: (bool value) {
              setState(() {
                reverse = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildPointerWidgetHandler() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text('Pointer Shape', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<PointerShape>(
                    borderRadius: BorderRadius.circular(10),
                    value: shape,
                    items: const [
                      DropdownMenuItem(
                        value: PointerShape.circle,
                        child: Text('circle '),
                      ),
                      DropdownMenuItem(
                        value: PointerShape.rectangle,
                        child: Text('rectangle'),
                      ),
                      DropdownMenuItem(
                        value: PointerShape.triangle,
                        child: Text('triangle '),
                      ),
                      DropdownMenuItem(
                        value: PointerShape.diamond,
                        child: Text('diamond '),
                      ),
                    ],
                    onChanged: (PointerShape? value) {
                      setState(() {
                        handleShapeChange(value!);
                      });
                    }),
              )),
        )
      ],
    );
  }

  void handleShapeChange(PointerShape? value) {
    if (value != null) {
      if (value == PointerShape.circle) {
        shape = PointerShape.circle;
      }
      if (value == PointerShape.rectangle) {
        shape = PointerShape.rectangle;
      }
      if (value == PointerShape.triangle) {
        shape = PointerShape.triangle;
      }
      if (value == PointerShape.diamond) {
        shape = PointerShape.diamond;
      }
    }
  }

  buildPointerPositionHandler() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child: const Text('Pointer Position', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<PointerPosition>(
                    borderRadius: BorderRadius.circular(10),
                    value: pointerPosition,
                    items: orientation == GaugeOrientation.horizontal
                        ? const [
                            DropdownMenuItem(
                              value: PointerPosition.top,
                              child: Text('top'),
                            ),
                            DropdownMenuItem(
                              value: PointerPosition.center,
                              child: Text('center'),
                            ),
                            DropdownMenuItem(
                              value: PointerPosition.bottom,
                              child: Text('bottom'),
                            ),
                          ]
                        : const [
                            DropdownMenuItem(
                              value: PointerPosition.left,
                              child: Text('left'),
                            ),
                            DropdownMenuItem(
                              value: PointerPosition.center,
                              child: Text('center'),
                            ),
                            DropdownMenuItem(
                              value: PointerPosition.right,
                              child: Text('right'),
                            ),
                          ],
                    onChanged: (PointerPosition? value) {
                      setState(() {
                        handlePositionChange(value!);
                      });
                    }),
              )),
        )
      ],
    );
  }

  void handlePositionChange(PointerPosition? value) {
    if (value != null) {
      if (value == PointerPosition.center) {
        pointerPosition = PointerPosition.center;
      }
      if (value == PointerPosition.top) {
        pointerPosition = PointerPosition.top;
      }
      if (value == PointerPosition.bottom) {
        pointerPosition = PointerPosition.bottom;
      }
      if (value == PointerPosition.left) {
        pointerPosition = PointerPosition.left;
      }
      if (value == PointerPosition.right) {
        pointerPosition = PointerPosition.right;
      }
    }
  }

  buildPointerAlignmentHandler() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child:
              const Text('Pointer Alignment', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<PointerAlignment>(
                    borderRadius: BorderRadius.circular(10),
                    value: alignment,
                    items: const [
                      DropdownMenuItem(
                        value: PointerAlignment.center,
                        child: Text('center'),
                      ),
                      DropdownMenuItem(
                        value: PointerAlignment.start,
                        child: Text('start'),
                      ),
                      DropdownMenuItem(
                        value: PointerAlignment.end,
                        child: Text('end'),
                      ),
                    ],
                    onChanged: (PointerAlignment? value) {
                      setState(() {
                        handleAlignmentChange(value!);
                      });
                    }),
              )),
        )
      ],
    );
  }

  void handleAlignmentChange(PointerAlignment value) {
    if (value == PointerAlignment.center) {
      alignment = PointerAlignment.center;
    }
    if (value == PointerAlignment.start) {
      alignment = PointerAlignment.start;
    }
    if (value == PointerAlignment.end) {
      alignment = PointerAlignment.end;
    }
  }

  buildValueHandler() {
    return Slider(
        min: 0,
        max: 100,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        value: value,
        onChanged: (double value) {
          setState(() {
            this.value = value;
          });
        });
  }

  buildPointerHeightHandler() {
    return Slider(
        min: 10,
        max: 100,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        value: height,
        onChanged: (double value) {
          setState(() {
            height = value;
          });
        });
  }

  buildPointerWidthHandler() {
    return Slider(
        min: 10,
        max: 100,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        value: width,
        onChanged: (double value) {
          setState(() {
            width = value;
          });
        });
  }
}

class LinearGaugeView extends StatelessWidget {
  const LinearGaugeView({
    super.key,
    required this.value,
    required this.height,
    required this.width,
    required this.shape,
    required this.position,
    required this.alignment,
    required this.orientation,
    required this.reverse,
  });

  final double value;
  final double height;
  final double width;
  final PointerShape shape;
  final PointerPosition position;
  final PointerAlignment alignment;
  final GaugeOrientation orientation;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LinearGauge(
            pointers: [
              Pointer(
                  value: value,
                  height: height,
                  width: width,
                  shape: shape,
                  pointerPosition: position,
                  pointerAlignment: alignment),
            ],
            gaugeOrientation: orientation,
            rulers: RulerStyle(
              inverseRulers: reverse,
              rulerPosition: RulerPosition.center,
            ),
          ),
        ),
      ),
    );
  }
}
