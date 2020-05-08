import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:allergy_detection_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../services/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt), title: Text('Scanner'))
          ],
        ),
        tabBuilder: (context, i) {
          if (i == 1) {
            return CupertinoPageScaffold(
              child: Text('Hello, World'),
              navigationBar: CupertinoNavigationBar(
                  middle: Text(
                    'Home Page',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: FlatButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      icon: Icon(
                        Icons.person,
                        color: CupertinoColors.activeBlue,
                      ),
                      label: Text(
                        'Log out',
                        style: TextStyle(color: CupertinoColors.activeBlue),
                      ))),
            );
          }
        },
      ),
    );
  }
}
