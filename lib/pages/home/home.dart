import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:allergy_detection_app/widgets/drawer_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:allergy_detection_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: Scaffold(
        endDrawer: DrawerLayout(
          auth: auth,
        ),
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Allergen Scanner'),
          elevation: 0.0,
        ),
        body: Container(),
      ),
    );
  }
}
