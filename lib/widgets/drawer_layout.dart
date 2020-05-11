import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:allergy_detection_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  final AuthService auth;

  DrawerLayout({Key key, @required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ClipPath(
          clipper: _DrawerCliper(),
          child: Drawer(
            child: SingleChildScrollView(
              child: Container(
                height: (orientation == Orientation.portrait)
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    DrawerItem(
                      text: 'Home',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                    ),
                    DrawerItem(
                      text: 'Scanner',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/scanner');
                      },
                    ),
                    DrawerItem(
                      text: 'Profile',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/profile');
                      },
                    ),
                    DrawerItem(
                      text: 'App Settings',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/scanner');
                      },
                    ),
                    DrawerItem(
                      text: 'Support',
                      onPressed: () {},
                    ),
                    DrawerItem(
                      text: 'Terms and Conditions',
                      onPressed: () {},
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FlatButton(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Wrong User? ',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            TextSpan(
                                text: 'Sign out',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline))
                          ]),
                        ),
                        onPressed: () {
                          auth.signOut();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
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

void hideDrawerAndNavigate(context, route) {
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed(route);
}
