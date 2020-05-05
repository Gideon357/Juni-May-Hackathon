import 'package:flutter/material.dart';
import 'package:allergy_detection_app/pages/scanner.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Scanner()
    },
  ));
}

