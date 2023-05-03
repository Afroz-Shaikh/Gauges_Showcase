import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

import 'package:showcase_app/utils/utils.dart';

import 'home.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(
          useMaterial3: true,
        ).copyWith(
          colorScheme: const ColorScheme.light(
            background: clearWhite,
            primary: Colors.blueAccent,
            secondary: Colors.red,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}

class Linear extends StatelessWidget {
  const Linear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearGauge(valueBar: [
        ValueBar(
            value: 50,
            color: Colors.red,
            valueBarThickness: 20,
            position: ValueBarPosition.top)
      ], rulers: const RulerStyle(rulerPosition: RulerPosition.top)),
    );
  }
}
