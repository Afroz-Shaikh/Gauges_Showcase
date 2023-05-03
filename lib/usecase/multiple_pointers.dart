import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class MultiplePointer extends StatelessWidget {
  const MultiplePointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGauge(
          showLinearGaugeContainer: true,
          linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
            thickness: 10,
            borderRadius: 10,
          ),
          customLabels: const [
            CustomRulerLabel(text: "Ordered", value: 0),
            CustomRulerLabel(text: "Shipped", value: 35),
            CustomRulerLabel(text: "Out for Delivery ", value: 70),
            CustomRulerLabel(text: "Delivered", value: 100),
          ],
          valueBar: [
            ValueBar(
                value: 63,
                enableAnimation: true,
                animationDuration: 5000,
                color: Colors.red,
                valueBarThickness: 10,
                borderRadius: 10)
          ],
          pointers: const [
            Pointer(
              value: 0,
              shape: PointerShape.circle,
              color: Colors.red,
              height: 30,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 0,
              shape: PointerShape.circle,
              color: Colors.white,
              height: 10,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 35,
              shape: PointerShape.circle,
              color: Colors.red,
              height: 30,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 35,
              shape: PointerShape.circle,
              color: Colors.white,
              height: 10,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 70,
              shape: PointerShape.circle,
              color: Colors.grey,
              height: 30,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 70,
              shape: PointerShape.rectangle,
              color: Colors.white,
              height: 10,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 100,
              shape: PointerShape.circle,
              color: Colors.grey,
              height: 30,
              width: 30,
              pointerPosition: PointerPosition.center,
            ),
            Pointer(
              value: 100,
              shape: PointerShape.triangle,
              color: Colors.white,
              height: 10,
              pointerPosition: PointerPosition.center,
            ),
          ],
          rulers: const RulerStyle(
            primaryRulersHeight: 15,
            primaryRulersWidth: 3,
            showSecondaryRulers: false,
            showPrimaryRulers: false,
            primaryRulerColor: Colors.blueGrey,
            secondaryRulerColor: Colors.blueGrey,
            rulerPosition: RulerPosition.bottom,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            labelOffset: 3,
          ),
        ),
      ),
    );
  }
}
