import 'package:flutter/material.dart';

showSnackBar(String title, BuildContext context) {
  final snackbar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(title),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
