import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProgressBar(),
    ),
  );
}

class MyProgressBar extends StatelessWidget {
  const MyProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.local_gas_station_rounded,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text('107 miles',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearGauge(
                  start: 0,
                  end: 100,
                  valueBar: [
                    ValueBar(
                        color: Colors.green,
                        value: 50,
                        valueBarThickness: 30,
                        borderRadius: 30,
                        edgeStyle: LinearEdgeStyle.bothCurve)
                  ],
                  linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
                    thickness: 30,
                    borderRadius: 30,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    backgroundColor: Color(0xff074e20),
                  ),
                  rulers: const RulerStyle(
                    showLabel: false,
                    showPrimaryRulers: false,
                    rulerPosition: RulerPosition.bottom,
                    showSecondaryRulers: false,
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
