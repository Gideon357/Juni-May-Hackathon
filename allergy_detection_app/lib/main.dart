import 'package:flutter/material.dart';
import 'package:allergy_detection_app/pages/home/scanner.dart';
import 'package:allergy_detection_app/pages/authenticate/sign_in.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => SignIn()
    },
  ));
}

