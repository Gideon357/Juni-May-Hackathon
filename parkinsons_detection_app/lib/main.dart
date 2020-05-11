import 'package:parkinsons_detection_app/services/auth_logic.dart';
import 'package:parkinsons_detection_app/widgets/drawer_layout.dart';
import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:parkinsons_detection_app/services/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        //home: Wrapper(),
        //TODO: Replace drawer layout with wrapper 
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
        ),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
