import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import '../utils/colors.dart';
import '../utils/snackbar.dart';
import '../widgets/playground_header.dart';

class LinearGaugePlayGround extends StatefulWidget {
  const LinearGaugePlayGround({super.key});

  @override
  State<LinearGaugePlayGround> createState() => _LinearGaugePlayGroundState();
}

class _LinearGaugePlayGroundState extends State<LinearGaugePlayGround> {
  // Configurations
  GaugeOrientation orientation = GaugeOrientation.horizontal;
  double _valueBarOffset = 0;
  PointerShape shape = PointerShape.triangle;
  // bool isHorizontal = true;
  double value = 0;
  bool reverse = false;

  ValueBarPosition _valueBarPosition = ValueBarPosition.center;
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
            shape: shape,
            valueBarPosition: _valueBarPosition,
            valueBarOffset: _valueBarOffset,
            orientation: orientation,
            reverse: reverse,
          ),
          Flexible(
            flex: screenWidth > 700 ? 1 : 3,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3))),
                padding: const EdgeInsets.all(8.0),
                height: screenWidth > 700 ? screenHeight : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Inverse Axis
                    const PlayGroundHeader(text: "Gauge Orientation"),
                    buildOrientationHandler(),
                    const PlayGroundHeader(text: "Ruler Style"),
                    inverseAxisHandler(),
                    const Divider(),
                    const PlayGroundHeader(text: "Value Bar"),
                    buildValueBarPosition(),
                    buildBarOffset(),
                    const Divider(),
                    // Pointer Shape
                    const PlayGroundHeader(text: "Pointers"),
                    buildPointerShapes(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildValueBarPosition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0),
          child:
              const Text('ValueBar position', style: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ValueBarPosition>(
                    autofocus: false,
                    focusColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    value: _valueBarPosition,
                    items: orientation == GaugeOrientation.horizontal
                        ? const [
                            DropdownMenuItem(
                              value: ValueBarPosition.top,
                              child: Text('top'),
                            ),
                            DropdownMenuItem(
                              value: ValueBarPosition.bottom,
                              child: Text('bottom'),
                            ),
                            DropdownMenuItem(
                              value: ValueBarPosition.center,
                              child: Text('center'),
                            ),
                          ]
                        : const [
                            DropdownMenuItem(
                              value: ValueBarPosition.left,
                              child: Text('left'),
                            ),
                            DropdownMenuItem(
                              value: ValueBarPosition.center,
                              child: Text('center'),
                            ),
                            DropdownMenuItem(
                              value: ValueBarPosition.right,
                              child: Text('right'),
                            ),
                          ],
                    onChanged: (value) {
                      handleValueBarPositionChange(value);
                    }),
              )),
        )
      ],
    );
  }

  void handleValueBarPositionChange(ValueBarPosition? value) {
    setState(() {
      if (orientation == GaugeOrientation.vertical) {
        switch (value) {
          case ValueBarPosition.left:
            _valueBarPosition = ValueBarPosition.left;
            break;
          case ValueBarPosition.right:
            _valueBarPosition = ValueBarPosition.right;
            break;
          case ValueBarPosition.center:
            _valueBarPosition = ValueBarPosition.center;
            break;
          default:
            _valueBarPosition = ValueBarPosition.center;
            break;
        }
      } else {
        switch (value) {
          case ValueBarPosition.top:
            _valueBarPosition = ValueBarPosition.top;
            break;
          case ValueBarPosition.bottom:
            _valueBarPosition = ValueBarPosition.bottom;
            break;
          case ValueBarPosition.center:
            _valueBarPosition = ValueBarPosition.center;
            break;
          default:
            _valueBarPosition = ValueBarPosition.center;
            break;
        }
      }
    });
  }

  Row buildPointerShapes() {
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
                    focusColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    value: shape,
                    items: const [
                      DropdownMenuItem(
                        value: PointerShape.circle,
                        child: Text('circle'),
                      ),
                      DropdownMenuItem(
                        value: PointerShape.rectangle,
                        child: Text('rectangle'),
                      ),
                      DropdownMenuItem(
                        value: PointerShape.triangle,
                        child: Text('triangle'),
                      ),
                      DropdownMenuItem(
                        value: PointerShape.diamond,
                        child: Text('diamond'),
                      ),
                    ],
                    onChanged: (PointerShape? value) {
                      setState(() {
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
                      });
                    }),
              )),
        )
      ],
    );
  }

  Row buildBarOffset() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(left: 5),
            child: const Text(
              'Bar offset',
              style: TextStyle(fontSize: 14),
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(foregroundColor: primaryColor),
          child: const Icon(Icons.add),
          onPressed: () {
            if (_valueBarPosition != ValueBarPosition.center) {
              setState(() {
                _valueBarOffset += 1;
              });
            } else {
              showSnackBar(
                "Can't increase offset when value bar is centered.",
                context,
              );
            }
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(foregroundColor: primaryColor),
          child: const Icon(Icons.remove),
          onPressed: () {
            if (_valueBarPosition != ValueBarPosition.center) {
              setState(
                () {
                  _valueBarOffset -= 1;
                },
              );
            } else {
              showSnackBar(
                "Can't decrease offset when value bar is centered.",
                context,
              );
            }
          },
        ),
      ],
    );
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

  Widget buildOrientationHandler() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CupertinoSlidingSegmentedControl<GaugeOrientation>(
        groupValue: orientation,
        children: const {
          GaugeOrientation.horizontal: Text('Horizontal'),
          GaugeOrientation.vertical: Text('Vertical'),
        },
        onValueChanged: (GaugeOrientation? value) {
          setState(() {
            if (value == null) return;

            orientation = value;
            _updateValueBarPosition();
          });
        },
      ),
    );
  }

  void _updateValueBarPosition() {
    if (orientation == GaugeOrientation.vertical) {
      _valueBarPosition = _valueBarPosition == ValueBarPosition.bottom
          ? ValueBarPosition.left
          : _valueBarPosition == ValueBarPosition.center
              ? ValueBarPosition.center
              : ValueBarPosition.right;
    } else if (orientation == GaugeOrientation.horizontal) {
      _valueBarPosition = _valueBarPosition == ValueBarPosition.left
          ? ValueBarPosition.bottom
          : _valueBarPosition == ValueBarPosition.center
              ? ValueBarPosition.center
              : ValueBarPosition.top;
    }
  }
}

class LinearGaugeView extends StatefulWidget {
  const LinearGaugeView({
    super.key,
    required this.shape,
    required ValueBarPosition valueBarPosition,
    required double valueBarOffset,
    required this.orientation,
    required this.reverse,
  })  : _valueBarPosition = valueBarPosition,
        _valueBarOffset = valueBarOffset;

  final PointerShape shape;
  final ValueBarPosition _valueBarPosition;
  final double _valueBarOffset;
  final GaugeOrientation orientation;
  final bool reverse;

  @override
  State<LinearGaugeView> createState() => _LinearGaugeViewState();
}

class _LinearGaugeViewState extends State<LinearGaugeView> {
  double value = 50;
  double valueBar = 75;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 30),
          width: MediaQuery.of(context).size.width / 2,
          // height: MediaQuery.of(context).size.height / 1,
          child: LinearGauge(
              pointers: [
                Pointer(
                  value: value,
                  isInteractive: true,
                  shape: widget.shape,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
                Pointer(
                  value: valueBar,
                  isInteractive: true,
                  shape: PointerShape.circle,
                  color: Colors.transparent,
                  onChanged: (value) {
                    setState(() {
                      valueBar = value;
                    });
                  },
                )
              ],
              valueBar: [
                ValueBar(
                    value: valueBar,
                    position: widget._valueBarPosition,
                    offset: widget._valueBarOffset),
              ],
              gaugeOrientation: widget.orientation,
              rulers: RulerStyle(
                  rulerPosition: RulerPosition.center,
                  inverseRulers: widget.reverse))),
    );
  }
}
