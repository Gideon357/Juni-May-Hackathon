import 'package:firebase_auth/firebase_auth.dart';
import 'package:allergy_detection_app/services/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Custom User object based on the FirebaseAuth User
  User _customUser (FirebaseUser user){
    return user != null ? new User(uid: user.uid) : null; 
  }

  // Anon sign in
  Future signinAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user =  result.user;
      return _customUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO: Email sign in

  // TODO: Register

  //TODO: Signout

}
