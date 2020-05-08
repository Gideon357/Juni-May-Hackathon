import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  DatabaseService({this.uid});

  Future updateUserData(
      {bool newUser = true,
      List<String> allergies,
      bool isSuperUser = false,
      String name = 'Null'}) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'allegies': allergies,
      'superuser': isSuperUser,
      'newUser' : newUser
    });
  }
}
