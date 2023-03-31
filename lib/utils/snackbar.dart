import 'package:flutter/material.dart';

showSnackBar(String title, BuildContext context) {
  bool isMobile = MediaQuery.of(context).size.width < 600;
  final screenWidth = MediaQuery.of(context).size.width;
  final snackbar = SnackBar(
    width: isMobile ? screenWidth : screenWidth / 3,
    backgroundColor: Colors.red.withOpacity(0.9),
    behavior: SnackBarBehavior.floating,
    content: Text(title),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
