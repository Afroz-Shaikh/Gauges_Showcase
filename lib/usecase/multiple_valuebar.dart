import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MultipleValueBar extends StatelessWidget {
  const MultipleValueBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: LinearGauge(
            valueBar: [
              ValueBar(
                  value: 70,
                  color: Colors.blue,
                  valueBarThickness: 6,
                  borderRadius: 10,
                  edgeStyle: LinearEdgeStyle.endCurve),
              ValueBar(
                value: 60,
                color: Colors.green,
                valueBarThickness: 6,
                edgeStyle: LinearEdgeStyle.endCurve,
                offset: 5,
                borderRadius: 10,
                position: ValueBarPosition.bottom,
              ),
              ValueBar(
                  value: 50,
                  color: Colors.red,
                  valueBarThickness: 6,
                  position: ValueBarPosition.top,
                  edgeStyle: LinearEdgeStyle.endCurve,
                  borderRadius: 10,
                  offset: 5),
            ],
            pointers: const [
              Pointer(
                value: 50,
                shape: PointerShape.rectangle,
                color: Colors.red,
                showLabel: true,
                height: 5,
                width: 0,
                pointerPosition: PointerPosition.top,
                labelStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Pointer(
                value: 60,
                shape: PointerShape.rectangle,
                color: Colors.red,
                showLabel: true,
                height: 15,
                width: 0,
                pointerPosition: PointerPosition.bottom,
                labelStyle:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Pointer(
                value: 70,
                shape: PointerShape.rectangle,
                color: Colors.red,
                showLabel: true,
                height: 0,
                width: 0,
                pointerPosition: PointerPosition.top,
                labelStyle:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
            rulers: const RulerStyle(
                rulerPosition: RulerPosition.bottom,
                labelOffset: 0,
                rulersOffset: 15),
          ),
        ),
      ),
    );
  }
}
