import 'package:flutter/material.dart';
import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          title: Text(
            'Login / Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                      print(email);
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                      print(password);
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.brown[400],
                  onPressed: () async {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
