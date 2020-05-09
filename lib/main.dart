import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:flutter/material.dart';
import 'package:allergy_detection_app/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:allergy_detection_app/services/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
        ),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
