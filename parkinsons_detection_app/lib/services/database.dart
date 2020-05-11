import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  DatabaseService({this.uid});

  Future updateUserData(
      {bool isNewUser = true,
      bool isSuperUser = false,
      List<String> allergies,
      String name = 'Null'}) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'allegies': allergies,
      'superuser': isSuperUser,
      'newUser': isNewUser
    });
  }

  // Stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
