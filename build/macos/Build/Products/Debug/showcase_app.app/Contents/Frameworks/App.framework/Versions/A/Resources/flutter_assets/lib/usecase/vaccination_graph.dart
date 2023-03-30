import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class MyVaccinationGraph extends StatelessWidget {
  const MyVaccinationGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const HeaderText()),
          const VaccinationLinearGauge(),
        ],
      ),
    );
  }
}

class VaccinationLinearGauge extends StatelessWidget {
  const VaccinationLinearGauge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinearGauge(
            fillExtend: true,
            extendLinearGauge: 20,
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                thickness: 60.0,
                linearGaugeValueColor: Colors.green,
                edgeStyle: LinearEdgeStyle.bothCurve,
                backgroundColor: Color(0xff9AAAAC)),
            start: 0,
            end: 100,
            gaugeOrientation: GaugeOrientation.horizontal,
            valueBar: [
              ValueBar(
                value: 70,
                color: Colors.green,
                valueBarThickness: 60,
              ),
              ValueBar(
                value: 30,
                color: Colors.green.shade900,
                position: ValueBarPosition.top,
                valueBarThickness: 10,
                borderRadius: 10,
                edgeStyle: LinearEdgeStyle.endCurve,
                offset: 10,
              )
            ],
            pointers: const [
              Pointer(
                  value: 30,
                  height: 0,
                  width: 40,
                  showLabel: true,
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  shape: PointerShape.circle,
                  color: Colors.red,
                  pointerPosition: PointerPosition.top),
            ],
            rulers: const RulerStyle(
              secondaryRulersWidth: 5,
              secondaryRulerPerInterval: 1,
              secondaryRulersHeight: 60,
              secondaryRulerColor: Colors.white,
              showPrimaryRulers: false,
              inverseRulers: false,
              rulerPosition: RulerPosition.center,
              showLabel: false,
            ),
          ),
          LinearGauge(
            extendLinearGauge: 0,
            start: 0,
            end: 50,
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 1,
            ),
            rulers: const RulerStyle(
              rulerPosition: RulerPosition.bottom,
              showSecondaryRulers: false,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text("% of population partially and fully vaccinated"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const LabelText(
                label: "Fully vaccinated",
                color: Colors.green,
              ),
              LabelText(
                label: "Partially vaccinated",
                color: Colors.green.shade900,
              ),
              const LabelText(label: "Not Vaccinated", color: Color(0xff9AAAAC))
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String label;
  final Color color;
  const LabelText({
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 20),
        Text(label),
      ],
    );
  }
}
