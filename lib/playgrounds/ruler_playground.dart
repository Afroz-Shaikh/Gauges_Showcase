import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import '../utils/colors.dart';
import '../widgets/playground_header.dart';

class RulerPlayGround extends StatefulWidget {
  const RulerPlayGround({super.key});

  @override
  State<RulerPlayGround> createState() => _RulerPlayGroundState();
}

class _RulerPlayGroundState extends State<RulerPlayGround> {
  // Configurations

  RulerPosition rulerPosition = RulerPosition.center;
  bool reverse = false;
  GaugeOrientation orientation = GaugeOrientation.horizontal;
  double labelOffset = 0;
  double rulerOffset = 0;
  bool showLabel = true;
  bool showPrimaryRuler = true;
  bool showSecondaryRuler = true;
  double gaugeThickness = 4;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Flex(
        direction: screenWidth > 1000 ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinearGaugeView(
            orientation: orientation,
            rulerPosition: rulerPosition,
            labelOffset: labelOffset,
            reverse: reverse,
            showLabel: showLabel,
            rulerOffset: rulerOffset,
            showPrimaryRulers: showPrimaryRuler,
            showSecondaryRulers: showSecondaryRuler,
            gaugeThickness: gaugeThickness,
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
                        const PlayGroundHeader(text: "Ruler Style"),
                        inverseAxisHandler(),
                        showLabelHandler(),
                        buildRulerPositionHandler(),
                        const Text("Label offset"),
                        buildLabelOffsetHandler(),
                        const Text("Ruler offset"),
                        buildRulerOffsetHandler(),
                        const Text("Show/Hide Rulers"),
                        showPrimaryRulerHandler(),
                        showSecondaryRulerHandler(),
                        const Text("Gauge thickness"),
                        buildGaugeThicknessHandler(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
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
              _updateValueBarPosition();
            }
          });
        },
      ),
    );
  }

  void _updateValueBarPosition() {
    if (orientation == GaugeOrientation.vertical) {
      rulerPosition = rulerPosition == RulerPosition.bottom
          ? RulerPosition.left
          : rulerPosition == RulerPosition.center
              ? RulerPosition.center
              : RulerPosition.right;
    } else if (orientation == GaugeOrientation.horizontal) {
      rulerPosition = rulerPosition == RulerPosition.left
          ? RulerPosition.bottom
          : rulerPosition == RulerPosition.center
              ? RulerPosition.center
              : RulerPosition.top;
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

  buildRulerPositionHandler() {
    // if (orientation == GaugeOrientation.horizontal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          child: Text('Ruler Position'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
            alignedDropdown: false,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<RulerPosition>(
                borderRadius: BorderRadius.circular(10),
                value: rulerPosition,
                items: orientation == GaugeOrientation.horizontal
                    ? const [
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.bottom,
                          child: Text('Bottom'),
                        ),
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.center,
                          child: Text('Center'),
                        ),
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.top,
                          child: Text('Top'),
                        ),
                      ]
                    : const [
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.left,
                          child: Text('Left'),
                        ),
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.center,
                          child: Text('Center'),
                        ),
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.right,
                          child: Text('Right'),
                        ),
                      ],
                onChanged: (RulerPosition? value) {
                  setState(() {
                    handleRulerPositionChange(value!);
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  void handleRulerPositionChange(RulerPosition value) {
    switch (value) {
      case RulerPosition.bottom:
        rulerPosition = RulerPosition.bottom;
        break;
      case RulerPosition.center:
        rulerPosition = RulerPosition.center;
        break;
      case RulerPosition.top:
        rulerPosition = RulerPosition.top;
        break;
      case RulerPosition.right:
        rulerPosition = RulerPosition.right;
        break;
      case RulerPosition.left:
        rulerPosition = RulerPosition.left;
        break;
    }
  }

  buildLabelOffsetHandler() {
    return Slider(
        min: 0,
        max: 100,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        value: labelOffset,
        onChanged: (double value) {
          setState(() {
            labelOffset = value;
          });
        });
  }

  buildRulerOffsetHandler() {
    return Slider(
        min: 0,
        max: 100,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        value: rulerOffset,
        onChanged: (double value) {
          setState(() {
            rulerOffset = value;
          });
        });
  }

  buildGaugeThicknessHandler() {
    return Slider(
        min: 0,
        max: 50,
        thumbColor: primaryColor,
        activeColor: primaryColor,
        value: gaugeThickness,
        onChanged: (double value) {
          setState(() {
            gaugeThickness = value;
          });
        });
  }

  Widget showLabelHandler() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Show Label', style: TextStyle(fontSize: 12)),
          CupertinoSwitch(
            activeColor: primaryColor,
            value: showLabel,
            onChanged: (bool value) {
              setState(() {
                showLabel = value;
              });
            },
          ),
        ],
      ),
    );
  }

  showSecondaryRulerHandler() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showSecondaryRuler = !showSecondaryRuler;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Show Secondary Ruler', style: TextStyle(fontSize: 12)),
          CupertinoSwitch(
            activeColor: primaryColor,
            trackColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            value: showSecondaryRuler,
            onChanged: (bool value) {
              setState(() {
                showSecondaryRuler = value;
              });
            },
          ),
        ],
      ),
    );
  }

  showPrimaryRulerHandler() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Show Primary Ruler', style: TextStyle(fontSize: 12)),
        CupertinoSwitch(
          activeColor: primaryColor,
          trackColor: MaterialStateColor.resolveWith((states) => Colors.white),
          value: showPrimaryRuler,
          onChanged: (bool value) {
            setState(() {
              showPrimaryRuler = value;
            });
          },
        ),
      ],
    );
  }
}

class LinearGaugeView extends StatelessWidget {
  const LinearGaugeView({
    super.key,
    required this.orientation,
    required this.reverse,
    required this.rulerPosition,
    required this.showLabel,
    required this.labelOffset,
    required this.rulerOffset,
    required this.showPrimaryRulers,
    required this.showSecondaryRulers,
    required this.gaugeThickness,
  });

  final GaugeOrientation orientation;
  final RulerPosition rulerPosition;
  final double labelOffset;
  final double rulerOffset;
  final bool reverse;
  final bool showLabel;
  final bool showPrimaryRulers;
  final bool showSecondaryRulers;
  final double gaugeThickness;

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
            linearGaugeBoxDecoration:
                LinearGaugeBoxDecoration(thickness: gaugeThickness),
            gaugeOrientation: orientation,
            rulers: RulerStyle(
              rulersOffset: rulerOffset,
              showPrimaryRulers: showPrimaryRulers,
              showSecondaryRulers: showSecondaryRulers,
              showLabel: showLabel,
              labelOffset: labelOffset,
              inverseRulers: reverse,
              rulerPosition: rulerPosition,
            ),
          ),
        ),
      ),
    );
  }
}
