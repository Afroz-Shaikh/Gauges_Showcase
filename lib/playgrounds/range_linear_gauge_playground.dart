import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import '../utils/colors.dart';
import '../widgets/playground_header.dart';

class RangeLinearGaugePlayGround extends StatefulWidget {
  const RangeLinearGaugePlayGround({super.key});

  @override
  State<RangeLinearGaugePlayGround> createState() =>
      _RangeLinearGaugePlayGroundState();
}

class _RangeLinearGaugePlayGroundState
    extends State<RangeLinearGaugePlayGround> {
  // Configurations

  RulerPosition rulerPosition = RulerPosition.bottom;
  bool reverse = false;
  GaugeOrientation orientation = GaugeOrientation.horizontal;

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
            reverse: reverse,
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
                        const Divider(),
                        buildRulerPositionHandler(),
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
                          value: RulerPosition.right,
                          child: Text('right'),
                        ),
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.center,
                          child: Text('Center'),
                        ),
                        DropdownMenuItem<RulerPosition>(
                          value: RulerPosition.left,
                          child: Text('left'),
                        ),
                      ],
                onChanged: (value) {
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
}

class LinearGaugeView extends StatelessWidget {
  const LinearGaugeView({
    super.key,
    required this.orientation,
    required this.reverse,
    required this.rulerPosition,
  });

  final GaugeOrientation orientation;
  final RulerPosition rulerPosition;
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
            rangeLinearGauge: [
              RangeLinearGauge(color: Colors.red, start: 0, end: 30),
              RangeLinearGauge(color: Colors.green, start: 30, end: 75),
              RangeLinearGauge(color: Colors.blue, start: 75, end: 100),
            ],
            gaugeOrientation: orientation,
            rulers: RulerStyle(
              inverseRulers: reverse,
              rulerPosition: rulerPosition,
            ),
          ),
        ),
      ),
    );
  }
}
