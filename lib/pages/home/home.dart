import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:allergy_detection_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:allergy_detection_app/services/database.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
               child: Text('Allergen Scanner'),
              ),
              ListTile(

              )
            ],
          ),
        ),
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Allergen Scanner'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}

