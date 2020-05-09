import 'package:allergy_detection_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      endDrawer: ClipPath(
        clipper: _DrawerCliper(),
        child: Drawer(
          child: Container(
            padding: EdgeInsets.only(top: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DrawerItem(
                  text: 'Home',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Scanner',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Profile',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'App Settings',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Logout',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Support',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Terms and Conditions',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerCliper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
