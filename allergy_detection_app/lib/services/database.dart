import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference userCollection = Firestore.instance.collection('users');
  
  Future updateUserData() async {
    
  }
}