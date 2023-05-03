import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(const MaterialApp(
    home: TimelineController(),
  ));
}

class TimelineController extends StatelessWidget {
  const TimelineController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearGauge(
            enableGaugeAnimation: true,
            customLabels: const [
              CustomRulerLabel(text: "12:00pm", value: 10),
              CustomRulerLabel(text: "", value: 15),
              CustomRulerLabel(text: "1:00pm", value: 20),
              CustomRulerLabel(text: "", value: 25),
              CustomRulerLabel(text: "2:00pm", value: 30),
              CustomRulerLabel(text: "", value: 35),
              CustomRulerLabel(text: "3:00pm", value: 40),
              CustomRulerLabel(text: "", value: 45),
              CustomRulerLabel(text: "4:00pm", value: 50),
            ],
            showLinearGaugeContainer: false,
            rulers: const RulerStyle(
              rulerPosition: RulerPosition.top,
              showLabel: true,
            ),
            linearGaugeBoxDecoration: const LinearGaugeBoxDecoration(
              thickness: 4,
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                TimelineShowTile(
                  title: "The Flash",
                  subtitle: "11:50 am - 1:10 pm",
                  color: Colors.red,
                  width: 400,
                ),
                TimelineShowTile(
                  title: "Peeky Blinders",
                  subtitle: "1:10 am - 3:30 pm",
                  color: Colors.blue,
                  width: 600,
                ),
                TimelineShowTile(
                  title: "Late Night with Jimmy Fallon",
                  subtitle: "3:30 am - 4:30 pm",
                  color: Colors.blue,
                  width: 600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimelineShowTile extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final double? width;

  const TimelineShowTile({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: width,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

//