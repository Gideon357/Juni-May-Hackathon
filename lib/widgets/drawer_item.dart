import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  DrawerItem({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
