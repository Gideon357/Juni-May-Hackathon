import 'package:flutter/material.dart';
import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = '';
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
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
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
                  validator: (val) =>
                      val.length < 6 ? 'Enter an Password 6+ chars long' : null,
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print('valid');
                      dynamic result =
                          await _auth.signinEmailPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Could not sign-in, please try again or contact support.');
                      }
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Don\'t have an account? Sign Up!')),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ));
  }
}
