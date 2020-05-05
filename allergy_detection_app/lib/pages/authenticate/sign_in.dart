import 'package:flutter/material.dart';
import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth =  AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey[900],
          title: Text(
            'Login / Sign Up',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Center(
            child: FlatButton.icon(
              color: Colors.white,
              textColor: Colors.black,
              icon: Icon(Icons.person),
              label: Text('Sign In Anonomously'),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null){
                  print('Error Signing In. See logs for auth_logic.dart');
                } else{
                  print('User logged in: ${result.uid}');
                } 
              },
            ),
          ),
        ));
  }
}
