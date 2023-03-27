import 'package:flutter/material.dart';
import 'package:showcase_app/utils/utils.dart';
import './home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
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
      home: HomePage(selectedItem: 0),
    ),
  );
}
