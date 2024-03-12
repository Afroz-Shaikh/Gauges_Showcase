import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WaterLevel(),
    ),
  );
}

class WaterLevel extends StatefulWidget {
  const WaterLevel({super.key});

  @override
  State<WaterLevel> createState() => _WaterLevelState();
}

class _WaterLevelState extends State<WaterLevel> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 200;
    double width = MediaQuery.of(context).size.width / 4;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: _WaterTankPainter(
                waterColor: Colors.blue, filledLevel: value, maxLevel: 100),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width / 8,
            child: LinearGauge(
                pointers: [
                  WidgetPointer(
                    value: value,
                    isInteractive: true,
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                    child: const Icon(
                      Icons.water_drop,
                      color: Colors.blue,
                    ),
                    // pointerPosition: PointerPosition.left,
                  )
                ],
                gaugeOrientation: GaugeOrientation.vertical,
                rulers: RulerStyle(rulerPosition: RulerPosition.right)),
          ),
          // Rotate the slider
          // RotatedBox(
          //   quarterTurns: 3,
          //   child: Slider(
          //     min: 0,
          //     max: 100,
          //     value: value,
          //     onChanged: (double value) {
          //       setState(() {
          //         this.value = value;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    ));
  }
}

class _WaterTankPainter extends CustomPainter {
  _WaterTankPainter({
    required this.waterColor,
    required this.maxLevel,
    required this.filledLevel,
  });
  final double maxLevel;
  final Color waterColor;
  final double filledLevel;

  @override
  void paint(Canvas canvas, Size size) {
    final double factor = size.height / maxLevel;
    final double height = 2 * factor * filledLevel;
    final Paint borderPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final Paint waterPaint = Paint()..color = waterColor;
    final Path path = _tankPath(size.width, size.height);
    canvas.drawPath(path, borderPaint);
    final Rect clipper = Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        height: height,
        width: size.width);
    canvas.clipRect(clipper);
    canvas.drawPath(path, waterPaint);
  }

  @override
  bool shouldRepaint(_WaterTankPainter oldDelegate) => true;
}

Path _tankPath(double width, double height) {
  return Path()
    ..lineTo(width, 0)
    ..lineTo(width * 0.75, height - 15)
    ..quadraticBezierTo(width * 0.74, height, width * 0.67, height)
    ..lineTo(width * 0.33, height)
    ..quadraticBezierTo(width * 0.26, height, width * 0.25, height - 15)
    ..close();
}
