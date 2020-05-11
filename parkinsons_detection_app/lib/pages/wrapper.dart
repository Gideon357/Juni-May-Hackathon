import 'package:parkinsons_detection_app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/pages/authenticate/authenticate.dart';
import 'package:parkinsons_detection_app/pages/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}