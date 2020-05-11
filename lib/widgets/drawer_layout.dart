import 'package:allergy_detection_app/services/auth_logic.dart';
import 'package:allergy_detection_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:allergy_detection_app/widgets/bottom_sheet_shape.dart';

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
                          _openSignOutDrawer(context, auth);
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

void _openSignOutDrawer(BuildContext context, AuthService auth) {
  showModalBottomSheet(
      shape: BottomSheetShape(),
      backgroundColor: Theme.of(context).primaryColor,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 16,
            left: 48,
            right: 48,
          ),
          height: 180,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Are you sure you want to sign out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      onPressed: () {
                        auth.signOut();
                        Navigator.of(context).pop();
                      },
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Text(
                        "Sign out",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      borderSide: BorderSide(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Stay logged in",
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
